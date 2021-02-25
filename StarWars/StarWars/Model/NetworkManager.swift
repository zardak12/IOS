//
//  NetworkManager.swift
//  StarWars
//
//  Created by Марк Шнейдерман on 23.02.2021.
//

import Foundation
import Alamofire


protocol NetworkManagerProtocol {
    func getHeroes(completion: @escaping ([Hero]?, AFError?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    let urlString = "https://akabab.github.io/starwars-api/api/all.json"

    //MARK: - Get Data with Alamofire
    func getHeroes(completion: @escaping ([Hero]?, AFError?) -> Void) {
        
        AF.request(urlString).responseDecodable(of: [Hero].self) { response in
            
            completion(response.value, response.error)
        }
    }
    
}
