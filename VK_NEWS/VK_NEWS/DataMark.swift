//
//  DataMark.swift
//  VK_NEWS
//
//  Created by Марк Шнейдерман on 02.01.2021.
//

import UIKit
import Foundation


enum name_Mark:String {
    case name_1 = "Программист"
    case name_2 = "Реалист"
    case name_3 = "Индивидуалист"
    case name_4 = "5 умных мыслей"
    case name_5 = "Словарный запас"
}


enum text_Mark:String{
    case text_1 = """
Как давно это было...
    
ххх
"""
    case text_2 = "Олды поймут..."
    case text_3 = """
Ηe тoму пиcьмo oтпpaвил
Индивидуaлиcт
"""
    case text_4 = """
Самый лучший подарок, который дарит нам судьба - это люди, которым мы говорим: "Спасибо, что ты есть".

Эрсин Тездажан
"""
    case text_5 = """
Неправильно ты, дядя Фёдор, просветления достичь хочешь.
Ты в стереотипах запутался,
а надо саморазвитием заниматься.
"""
}









struct UserModel{
    var ava : UIImage
    var name : String
    var text : String
    var photo : UIImage
}
