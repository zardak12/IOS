//
//  Post.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 23.01.2021.
//

import Foundation
import UIKit

struct Post:Codable{
    let data : String
    let id : String!
    let text : String?
    let image : String!
    let likes : Int
    
}
