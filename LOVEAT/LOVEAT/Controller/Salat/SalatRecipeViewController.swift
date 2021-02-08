//
//  SalatRecipeViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class SalatRecipeViewController: UIViewController {

    @IBOutlet weak var salatImageView: UIImageView!
    @IBOutlet weak var salatLabel: UILabel!
    
    @IBOutlet weak var salatTextView: UITextView!
    
    var recipe :salatModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salatLabel.text = recipe.product
        salatImageView.image = recipe.photo
        salatImageView.layer.borderWidth = 3.0
        salatTextView.text = recipe.salatRecipe
        salatTextView.isEditable = false
        
    }


}
