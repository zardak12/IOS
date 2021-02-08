//
//  AboutMeViewController.swift
//  VK_NEWS
//
//  Created by Марк Шнейдерман on 03.01.2021.
//

import UIKit

class AboutMeViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var shapkaImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusTextfield: UITextField!
    
    @IBOutlet weak var avaImageView: UIImageView!
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    
    @IBOutlet weak var townImageView: UIImageView!
    
    @IBOutlet weak var educationImageView: UIImageView!
    
    @IBOutlet weak var folowersImageView: UIImageView!
    
  
    @IBOutlet weak var townLabel: UILabel!
    
    
    @IBOutlet weak var educationLabel: UILabel!
    
    
    @IBOutlet weak var followersLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        
        nameLabel.text = "Марк Шнейдерман"
        statusTextfield.text = "Укажите статус"
        shapkaImageView.image = #imageLiteral(resourceName: "шапка")
        avaImageView.layer.cornerRadius = 0.5 * avaImageView.bounds.size.width
        avaImageView.image = #imageLiteral(resourceName: "ava")
        menuImageView.image = #imageLiteral(resourceName: "панель")
        townImageView.image = #imageLiteral(resourceName: "дом")
        townLabel.text = "Г. Саратов"
        educationImageView.image = #imageLiteral(resourceName: "учеба")
        educationLabel.text = "Образование : НИТУ МИСиС"
        followersLabel.text = "113 подписчиков"
        folowersImageView.image = #imageLiteral(resourceName: "подписчики")
        statusTextfield.delegate = self
        educationLabel.sizeToFit()
        followersLabel.sizeToFit()
        nameLabel.sizeToFit()
        statusTextfield.sizeToFit()
        super.viewDidLoad()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextfield.resignFirstResponder()
        return true
    }
}
