//
//  MenuViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var salatOutlet: UIButton!
    
    @IBOutlet weak var soupOutlet: UIButton!
    
    @IBOutlet weak var secondOutlet: UIButton!
    
    
    @IBOutlet weak var desertOutlet: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton()
    }
    
    func roundButton(){
        salatOutlet.layer.cornerRadius = salatOutlet.frame.size.height/2
        soupOutlet.layer.cornerRadius = soupOutlet.frame.size.height/2
        secondOutlet.layer.cornerRadius = secondOutlet.frame.size.height/2
//        desertOutlet.layer.cornerRadius = desertOutlet.frame.size.height/2
    }
}
