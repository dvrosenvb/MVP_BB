//
//  ViewController.swift
//  BreakingBad
//
//  Created by Rosendo VB - Rosenvb on 12/02/22.
//

import UIKit

class CharacterViewController: UIViewController, CharPresenterDelegate, UITableViewDelegate, UITableViewDataSource {
 
    //MARK: Outlets
    @IBOutlet var viewTableContainer: UIView!
    @IBOutlet var tfSearch: UITextField!
    
    //MARK: UIElements
    private let tableForCharacters:UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    //MARK: Variables
    private let presenter = CharPresenter()
    private var characters = [BBChar]()
    
    //MARK: LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        installView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ThemeManager.title_color]
        presenter.setViewDelegate(delegate: self)
        viewTableContainer.addSubview(tableForCharacters)
        tableForCharacters.delegate = self
        tableForCharacters.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableForCharacters.frame = viewTableContainer.bounds
    }
    
    //MARK: Actions
    @IBAction func btnSearch(_ sender: Any) {
        guard let txt = tfSearch.text else { return }
        presenter.searchCharacter(txt.setName(txt))
        view.endEditing(true)
    }
    
    
    //MARK: ViewFunctions
    func installView()  {
        let viewAux = UIView()
        viewAux.frame.size = CGSize(width: 20, height: 10)
        
        let viewAuxR = UIView()
        viewAuxR.frame.size = CGSize(width: 60, height: 20)
        
        tfSearch.rightViewMode = .always
        tfSearch.rightView = viewAuxR
        tfSearch.leftView = viewAux
        tfSearch.leftViewMode = .always
        tfSearch.borderStyle = .none
        tfSearch.placeholder = ThemeManager.PLACE_HOLDER
        tfSearch.layer.cornerRadius = 30
        tfSearch.layer.borderWidth = 1
        tfSearch.layer.borderColor = ThemeManager.title_color.cgColor
        
        tableForCharacters.backgroundColor = .clear
    }
    
    
    //MARK: Delegate Functions
    
    func presentCharacters(characters: [BBChar]) {
        self.characters = characters
        DispatchQueue.main.async {
            self.tableForCharacters.reloadData()
        }
    }
    
    func showCharactersDetail(title: String, message: String) {
        
    }
    
    func setImage(image: UIImage, name: String, nickName: String, status: String) {
        let vc = CharacterDetailView(img:image ,name: name, status: status, nickname: nickName)
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: Table Delegate Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = ThemeManager.title_color
        cell.textLabel?.font = ThemeManager.MediumFont(24)
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.charTapped(character: characters[indexPath.row])
    }
    
}

