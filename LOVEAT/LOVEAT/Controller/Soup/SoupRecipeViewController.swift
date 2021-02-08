//
//  SoupRecipeViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class SoupRecipeViewController: UIViewController {
    
    @IBOutlet weak var soupImageView: UIImageView!
    @IBOutlet weak var soupLabel: UILabel!
    @IBOutlet weak var soupTextView: UITextView!
    
    var souprecipe:soupModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        soupLabel.text = souprecipe.product
        soupImageView.image = souprecipe.photo
        soupImageView.layer.borderWidth = 3.0
        soupTextView.text = souprecipe.soupRecipe
        soupTextView.isEditable = false
    }

}
