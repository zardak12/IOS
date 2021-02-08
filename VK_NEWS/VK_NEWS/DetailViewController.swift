//
//  DetailViewController.swift
//  VK_NEWS
//
//  Created by Марк Шнейдерман on 02.01.2021.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var nameImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var stroyLabel: UITextField!
    
    @IBOutlet weak var additonalImageView: UIImageView!
    
    
    
    var user : UserModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameImageView.layer.cornerRadius = 0.5 * nameImageView.bounds.size.width
        nameImageView.image = user.ava
        nameLabel.text = user.name
        stroyLabel.text = user.text
        additonalImageView.image = user.photo
        stroyLabel.delegate = self
        nameLabel.sizeToFit()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        stroyLabel.resignFirstResponder()
        return true
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
