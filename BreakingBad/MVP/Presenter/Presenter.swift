//
//  Presenter.swift
//  BreakingBad
//
//  Created by Rosendo Vázquez Bailón on 12/02/22.
//

import Foundation
import Alamofire
import UIKit

protocol CharPresenterDelegate:AnyObject {
    func presentCharacters(characters:[BBChar])
    func showCharactersDetail(title:String, message:String)
    func setImage(image:UIImage, name:String, nickName:String, status:String)
}

typealias PresenterDelegate = CharPresenterDelegate & UIViewController

class CharPresenter {
    weak var delegate:PresenterDelegate?
    
    public func searchCharacter(_ name:String){
        let url = "\(ThemeManager.BASE_URL)\(ThemeManager.CHAR_PATH)\(name.setName(name))"
        AF.request(url, method: .get).responseDecodable(of: [BBChar].self) {[weak self] response in
            guard let fetchedValue = response.value else { return }
            self?.delegate?.presentCharacters(characters: fetchedValue)
        }
    }
    
    public func setViewDelegate(delegate:PresenterDelegate){
        self.delegate = delegate
    }
    
    func getImage(_ url:String, name:String, nickName:String, status:String){
        AF.request(url, method: .get).response { response in
            if case .success(let image) = response.result {
                guard let img = image else { return }
                guard let img1 = UIImage(data: img) else { return }
                self.delegate?.setImage(image: img1, name: name, nickName: nickName, status: status)
            }
        }
    }
    
    public func charTapped(character:BBChar){
        guard let urlImg = character.img,
              let nameCharacter = character.name,
              let nickNameCharacter = character.nickname,
              let statusCharacter = character.status else { return  }
        
        getImage(urlImg, name: nameCharacter, nickName: nickNameCharacter, status: statusCharacter)
    }
    
}

