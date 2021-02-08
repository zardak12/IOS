//
//  User.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 12.01.2021.
//

import Foundation
import UIKit

struct User{
    var ava : UIImage
    var name : String
    var followers : Int
    var subscriptions : Int
    var publications : Int
    var status : String?
    var websait: String?
    var count_images:Int
    var user_post:[Post]!
    
}


