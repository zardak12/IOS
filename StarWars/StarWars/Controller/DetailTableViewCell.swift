//
//  DetailTableViewCell.swift
//  StarWars
//
//  Created by Марк Шнейдерман on 23.02.2021.
//

import UIKit
import Kingfisher

class DetailTableViewCell: UITableViewCell {

    
    static let identifier = "Hero"
    var imageViewHero = UIImageView()
    var nameHeroLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        imageViewHero.translatesAutoresizingMaskIntoConstraints = false
        nameHeroLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.imageViewHero)
        self.addSubview(self.nameHeroLabel)
        self.imageViewHero.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        self.imageViewHero.topAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
        self.imageViewHero.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 1).isActive = true
        self.imageViewHero.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imageViewHero.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.imageViewHero.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.nameHeroLabel.leftAnchor.constraint(equalTo: imageViewHero.rightAnchor,constant: 10).isActive = true
        self.nameHeroLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.nameHeroLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.nameHeroLabel.centerYAnchor.constraint(equalTo: imageViewHero.centerYAnchor).isActive = true
        self.nameHeroLabel.font = UIFont.systemFont(ofSize: 15,weight: .bold)
    }
    
    func configure(with hero : Hero)
    {
        guard let url = URL(string: hero.image ?? "") else {return}
        imageViewHero.kf.setImage(with: url)
        nameHeroLabel.text = hero.name
        nameHeroLabel.sizeToFit()
    }
}
