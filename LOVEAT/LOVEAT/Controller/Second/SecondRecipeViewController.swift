//
//  SecondRecipeViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class SecondRecipeViewController: UIViewController {

    
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var reciepeTextView: UITextView!
    
    var recipe:secondModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        secondImageView.image = recipe.photo
        nameLabel.text =  recipe.product
        secondImageView.layer.borderWidth = 3.0
        reciepeTextView.text = recipe.secondRecipe
        reciepeTextView.isEditable = false
    }
    


}
