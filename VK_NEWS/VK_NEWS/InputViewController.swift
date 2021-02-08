//
//  InputViewController.swift
//  VK_NEWS
//
//  Created by Марк Шнейдерман on 30.12.2020.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuImage.image = #imageLiteral(resourceName: "Screenshot at Dec 30 22-59-30")
        buttonOutlet.backgroundColor = UIColor.systemBlue
        buttonOutlet.setTitle("Вход", for: .normal)
        buttonOutlet.setTitleColor(UIColor.white, for: .normal)
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        
        
        // переделать в свитч кейс и отметить User: String = "имя", а потом использовывать это имя для всех
        
        if self.loginTextField.text == "1" && self.passwordTextField.text == "1" {
            self.performSegue(withIdentifier: "MARK", sender: nil)
        }
        else{
            // create the alert
            let alert = UIAlertController(title: "Ошибка", message: "Вы ввели неправильный логин или пароль", preferredStyle: UIAlertController.Style.alert)

            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
