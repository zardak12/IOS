//
//  DataManager.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 23.01.2021.
//

import Foundation


class DataManager : DataManagerProtocol {
    
    static let sharedData = DataManager()
    public var settings : Profile_page
    public var mark : User
    private var posts: [Post]
    
    init () {
        
        posts = []
        for i in 1...15 {
            let like = Int.random(in: 0...1000)
            let date = Int.random(in: 0...30)
            let id = UUID().uuidString
            posts.append(Post(data: "\(date) дней назад", id: id, text: "\(15-i+1) моя фотография", image: "Image_\(i)", likes: like))
        }
        mark = User(ava: #imageLiteral(resourceName: "ava"), name: "Shmarkyr", followers: 67, subscriptions: 294, publications: 178,websait: "https://vk.com/shmarkyr",count_images:15,user_post:posts)
        settings = Profile_page(followers: "Подписчики", subscriptions: "Подписки", publications: "Публикации", butttonEdit: "Редактировать профиль")
        
        
    }
    
    // сохранение поста
    
    func syncSavePost(with post: [Post]) {
        self.posts.append(contentsOf: post)
    }
    
    func asyncSavePost(with post: [Post], completion: @escaping () -> Void) {
        let operationQeue = OperationQueue()//создали очередь
        
        DispatchQueue.global(qos: .userInteractive).async { // сделали асинхронно
            let operation = BlockOperation{ [weak self] in // делаем блок оперэйшен
                self?.posts.append(contentsOf: post) //добавляем пост
                completion()// вызываем выполнение компленшн
            }
            operationQeue.addOperation(operation)
        }
    }
    
    //получение поста
    
    func syncGetPosts() -> [Post] {
        return posts
    }
    
    func asyncGetPosts(completion: @escaping ([Post]) -> Void) {
        let operationQuee = OperationQueue()
        DispatchQueue.global(qos: .userInteractive).async {
            let operation = BlockOperation{ [weak self] in
                guard let post = self?.posts else {return}
                completion(post)
            }
            operationQuee.addOperation(operation)
        }
    }
    
    func syncDeletePost(with id: String) {
        if let index = posts.firstIndex(where: {$0.id == id}){
            posts.remove(at: index)
        }
    }
    
    func asyncDeletePost(with post:Post, completion: @escaping ([Post]) -> Void) {
        let operationQuee = OperationQueue()
        DispatchQueue.global(qos: .userInteractive).async {
            let operation = BlockOperation{ [weak self] in
                guard let index = self?.posts.firstIndex(where: {$0.id==post.id} ) else {return}
                self?.posts.remove(at: index)
            }
            DispatchQueue.main.async { [weak self] in
                guard let posts = self?.posts else {return}
                completion(posts)
            }
            operationQuee.addOperation(operation)
        }
    }
    
    func syncSearchPost(with name: String) -> [Post] {
        let foundPosts = posts.filter { (post) -> Bool in
            
            if let postText = post.text {
                return postText.contains(name)
            }
            return false
        }
        return foundPosts
    }
    
    func asynSearchPost(with name : String, completion: @escaping ([Post]) -> Void) {
        let operationQueue = OperationQueue()
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let operation = BlockOperation { [weak self] in
                
                let filteredPosts = self?.posts.filter({ post -> Bool in
                    return (post.text?.lowercased().contains(name.lowercased()))!
                })
                
                guard let filteredPostsUnwrapped = filteredPosts
                    else { return }
                completion(filteredPostsUnwrapped)
            }
            operationQueue.addOperation(operation)
        }
    }
    
    func syncGetUser() -> User{
        return mark
    }
    func asyncGetUser(completion: @escaping (User) -> Void){
        let operationQuue = OperationQueue()
        DispatchQueue.global(qos: .userInteractive).async {[weak self] in
            let operation = BlockOperation{
                guard let user = self?.mark else {return}
                completion(user)
            }
            operationQuue.addOperation(operation)
        }
    }
    
    
    
    
    func asyncGetProfilePage(completion:@escaping(Profile_page)->Void){
        let operationQueue = OperationQueue()
        DispatchQueue.global(qos: .userInteractive).async {[weak self] in
            let operation = BlockOperation{
                guard let page = self?.settings else {return}
                completion(page)
            }
            operationQueue.addOperation(operation)
        }
    }
 
}
