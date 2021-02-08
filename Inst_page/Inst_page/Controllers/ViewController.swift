//
//  ViewController.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 12.01.2021.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
      //MARK: - PROFILE
    @IBOutlet weak var labelPublic: UILabel!
    @IBOutlet weak var labelFolowers: UILabel!
    @IBOutlet weak var labelSub: UILabel!
    @IBOutlet weak var buttonChangeOutlet: UIButton!
      //MARK: - USER
    @IBOutlet weak var labelNickName: UILabel!
    @IBOutlet weak var avaImageView: UIImageView!
    @IBOutlet weak var labelCountPublic: UILabel!
    @IBOutlet weak var labelCountFollowers: UILabel!
    @IBOutlet weak var labelCountSub: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelWebSait: UILabel!
    
    //MARK: - Indetifier
    let identifier = "Go"
    let reuseIdentifier = "Cell"
      //MARK: - Data
    var mark:User!
    var posts = [Post]()
    var prof: Profile_page!
    weak var delegate:DeleteDelegate?
    //var mark = User(ava: #imageLiteral(resourceName: "ava"), name: "Shmarkyr", followers: 67, subscriptions: 294, publications: 178,websait: "https://vk.com/shmarkyr",images:mark_images,count_images:15)
    //var prof = Profile_page(followers: "Подписчики", subscriptions: "Подписки", publications: "Публикации", butttonEdit: "Редактировать профиль")
    
    

    override func viewDidLoad() {
        
        configure()
        super.viewDidLoad()
    }
    
    
      //MARK: - Метод который конфигурирует все
    func configure()
    {
        DataManager.sharedData.asyncGetUser { [weak self]user in
            self?.mark = user
     
        }
        
        DataManager.sharedData.asyncGetProfilePage { [weak self]page in
            self?.prof = page
        }
        getCollectionView()
        DataManager.sharedData.asyncGetPosts { [weak self]post in
            self?.posts = post
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        getSettings()
        getUser()
        
    }
      //MARK: - Устанавление базовых настроек
    func getSettings(){
        labelPublic.text =   prof.publications
        labelFolowers.text = prof.followers
        labelSub.text = prof.subscriptions
        buttonChangeOutlet.setTitle(prof.butttonEdit, for: .normal)
        buttonChangeOutlet.layer.borderWidth = 0.3
        buttonChangeOutlet.layer.borderColor = UIColor.black.cgColor
        buttonChangeOutlet.layer.cornerRadius = 3
    }
      //MARK: - Настройка базовая CollectionView
    func getCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let lay = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = lay
    }
      //MARK: - Заоплняем юзера
    func getUser(){
        labelNickName.text = mark.name
        avaImageView.image = mark.ava
        avaImageView.layer.cornerRadius = avaImageView.frame.height / 2
        avaImageView.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1)
        avaImageView.layer.borderWidth = 1
        labelCountPublic.text = String(describing:mark.publications)
        labelCountFollowers.text = String(describing:mark.followers)
        labelCountSub.text = String(describing:mark.subscriptions)
        labelStatus.text = "В душе ребнок"
        labelWebSait.text = mark.websait
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        let post = posts[indexPath.row]
        cell.configure(with:post)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.bounds.width
        let cellWidth = screenWidth/3
        return CGSize(width: cellWidth-7, height: cellWidth-7)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier:identifier , sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifier,let indexPath = sender as? IndexPath{
            let dest = segue.destination as! DetailViewController
            dest.delegate = self
            dest.indexPathRow = indexPath.row
        }
    }

}

//MARK: - Delete Post Extension
extension ViewController:DeleteDelegate{
    func deletePost(with post: Post) {
        DataManager.sharedData.asyncGetPosts { [weak self]posts in
            self?.posts = posts
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

