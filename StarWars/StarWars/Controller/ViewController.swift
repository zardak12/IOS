//
//  ViewController.swift
//  StarWars
//
//  Created by Марк Шнейдерман on 22.02.2021.
//

import UIKit
import FittedSheets

class ViewController: UIViewController {
    
    var tableView =  UITableView()
    var networkManager : NetworkManagerProtocol = NetworkManager()
    var dataSource = [Hero]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Star Wars Heroes"
        setUp()
        setDataSource()
    }
    
    
    func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.estimatedRowHeight = 200
    }
    
    func setDataSource() {
        
        self.networkManager.getHeroes { [weak self] (heroes, error) in
            
            if error != nil {
                print(error!.errorDescription ?? "Failure")
                return
            }
            
            guard let heroes = heroes else { print("Heroes is nil"); return }
            
            DispatchQueue.main.async {
                
                self?.dataSource = heroes
                self?.tableView.reloadData()
            }
        }
        
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        let user = dataSource[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = HeroViewController()
        controller.hero = self.dataSource[indexPath.row]
        let sheet = SheetViewController(controller: controller, sizes: [.percent(0.7)])
        present(sheet, animated: false)
    }
    
}
