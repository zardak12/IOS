//
//  DataManagerProtocol.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 23.01.2021.
//

import Foundation

protocol DataManagerProtocol {
    func syncSavePost(with post : [Post])
    func asyncSavePost(with post : [Post],completion:@escaping()->Void)
    func syncGetPosts()->[Post]
    func asyncGetPosts(completion:@escaping([Post])->Void)
    func syncDeletePost(with id:String)
    func asyncDeletePost(with  post:Post,completion:@escaping([Post])->Void)
    func syncSearchPost(with name:String)->[Post]
    func asynSearchPost(with name: String,completion:@escaping([Post])->Void)
    func syncGetUser() -> User
    func asyncGetUser(completion: @escaping (User) -> Void)
    func asyncGetProfilePage(completion:@escaping(Profile_page)->Void)
}
