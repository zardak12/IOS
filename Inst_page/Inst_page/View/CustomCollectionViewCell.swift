//
//  CustomCollectionViewCell.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 23.01.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var publicimageView: UIImageView!
    
    public func configure(with post : Post){
        publicimageView.image = UIImage(named:post.image)
    }
}
