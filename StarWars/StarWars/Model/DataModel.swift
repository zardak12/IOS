//
//  Model.swift
//  StarWars
//
//  Created by Марк Шнейдерман on 23.02.2021.
//

import Foundation

struct Hero : Codable {
    
    var id : Int?
    var name: String
    var gender: String?
    var homeworld: [String]?
    var image: String?
    var bornLocation: String?
    var diedLocation: String?
    var born : Int?
    var died : Int?

    enum CodingKeys : String,CodingKey{
        case id
        case name
        case gender
        case homeworld
        case image
        case bornLocation
        case diedLocation
        case born
        case died
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        gender = try? container.decode(String.self, forKey: .gender)
        self.homeworld = try? container.decode([String].self, forKey: .homeworld)
        if self.homeworld == nil {

            let str = try? container.decode(String.self, forKey: .homeworld)

            self.homeworld = [str ?? ""]
        }
        image = try container.decode(String?.self, forKey: .image)
        bornLocation = try? container.decode(String.self, forKey: .bornLocation)
        diedLocation = try? container.decode(String.self, forKey: .diedLocation)
        born = try? container.decode(Int.self, forKey: .born)
        died = try? container.decode(Int.self, forKey: .died)
    }
}

