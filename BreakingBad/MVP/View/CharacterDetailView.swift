//
//  CharacterDetailView.swift
//  BreakingBad
//
//  Created by Rosendo Vázquez Bailón on 12/02/22.
//

import Foundation
import UIKit
import SnapKit

class CharacterDetailView:UIViewController{
    //MARK: UIElements
    lazy var lblName:UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.text_green_soft_color
        label.font = ThemeManager.BoldFont(48)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lblNickName:UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.text_green_soft_color
        label.font = ThemeManager.MediumFont(32)
        return label
    }()
    
    lazy var lblStatus:UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.text_green_soft_color
        label.font = ThemeManager.RegularFont(12)
        return label
    }()
    
    lazy var btnClose:UIButton = {
        let btn = UIButton()
        btn.setTitle("Watch best moments", for: .normal)
        btn.backgroundColor = .clear
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 24
        btn.layer.borderColor = ThemeManager.text_green_soft_color.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    lazy var imgAvatar:UIImageView = {
        let img = UIImageView()
        img.layer.borderWidth = 2
        img.layer.borderColor = ThemeManager.text_green_stone_color.cgColor
        
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    //MARK: Variables
    var name:String?
    var img:UIImage?
    var status:String?
    var nickname:String?
    
    //MARK: Initializer/s
    init(img: UIImage ,name:String , status:String,nickname:String) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.img = img
        self.status = status
        self.nickname = nickname
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        installView()
    }
    
    //MARK: View Functions
    func installView(){
        lblName.text = name
        lblNickName.text = "AKA - \(nickname ?? "Unknow" )"
        lblStatus.text = status
        
        view.backgroundColor = ThemeManager.elegant_Bg
        
        view.addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().offset(16)
        }
        
        view.addSubview(lblNickName)
        lblNickName.snp.makeConstraints { make in
            make.top.equalTo(lblName.snp.bottom).offset(20)
            make.leading.equalTo(lblName.snp.leading).offset(6)
        }
        
        view.addSubview(lblStatus)
        lblStatus.snp.makeConstraints { make in
            make.top.equalTo(lblNickName.snp.bottom).offset(20)
            make.leading.equalTo(lblNickName.snp.leading).offset(4)
        }
        
        imgAvatar.image = img
        view.addSubview(imgAvatar)
        imgAvatar.snp.makeConstraints { make in
            make.width.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(lblStatus.snp.bottom).offset(30)
            
        }
        
        view.addSubview(btnClose)
        btnClose.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.width.equalTo(280)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
        
        btnClose.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
    }
    
    
    //MARK: Functions
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
}
