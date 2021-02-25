//
//  HeroViewController.swift
//  StarWars
//
//  Created by Марк Шнейдерман on 24.02.2021.
//

import UIKit
import Kingfisher

class HeroViewController: UIViewController {

    var hero : Hero?
    var imageViewHero = UIImageView()
    var nameLabel = UILabel()
    var genderLabel = UILabel()
    var homeworldLabel = UILabel()
    var bornLocationLabel = UILabel()
    var diedLocationLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        herroSettings()
    }

    
    func herroSettings(){
        imageViewHero.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        homeworldLabel.translatesAutoresizingMaskIntoConstraints = false
        bornLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        diedLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageViewHero)
        view.addSubview(nameLabel)
        view.addSubview(genderLabel)
        view.addSubview(homeworldLabel)
        view.addSubview(bornLocationLabel)
        view.addSubview(diedLocationLabel)
        imageViewHero.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageViewHero.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        imageViewHero.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageViewHero.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageViewHero.kf.setImage(with: URL(string: hero?.image ?? ""))
        nameLabel.topAnchor.constraint(equalTo: imageViewHero.bottomAnchor, constant: 5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        nameLabel.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        nameLabel.text = "Имя: \(hero?.name ?? "Отсутсвует")"
        genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        genderLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        genderLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        genderLabel.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        genderLabel.text = "Пол: \(hero?.gender ?? "Неизвестно")"
        homeworldLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5).isActive = true
        homeworldLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        homeworldLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        homeworldLabel.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        homeworldLabel.text = "Живет: \(hero?.homeworld?.first ?? "Неизвестно")"
        bornLocationLabel.topAnchor.constraint(equalTo: homeworldLabel.bottomAnchor, constant: 5).isActive = true
        bornLocationLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        bornLocationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        bornLocationLabel.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        bornLocationLabel.text = "Место рождения:\((hero?.homeworld?.first) ?? "Неизвестно")"
        diedLocationLabel.topAnchor.constraint(equalTo: bornLocationLabel.bottomAnchor, constant: 5).isActive = true
        diedLocationLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        diedLocationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        diedLocationLabel.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        diedLocationLabel.text = "Место смерти: \(hero?.homeworld?.first ?? "Неизвестно")"
    }

}
