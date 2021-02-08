//
//  DetailViewController.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 25.01.2021.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchResultsUpdating{
    
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var mark : User!
    var posts = [Post]()
    var filterPost = [Post]()
    // если поиск пуст false а если нет то возвращает true когда текст пуст
    var searchBarIsEmpty: Bool {
        
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    // строка показывает нам когда мы пользуемся поиском возвращает true не пользуемся возврашает nil
    var isFiltering: Bool { return searchController.isActive && !searchBarIsEmpty }
    weak var delegate : DeleteDelegate?
    
    var indexPathRow: Int!
    let tableIdent = "Cell"
    let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        configure()
        configureSearchContoller()
        super.viewDidLoad()
    }
    // после того как появился , происходит метод DidAppear()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // происходит скролл нужной нам ячейки
        
        tableView.scrollToRow(at: IndexPath(row: indexPathRow , section: 0), at: .middle, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filterPost.count : posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:tableIdent , for: indexPath) as! CustomTableViewCell
        let post = posts[indexPath.row]
        cell.delegate = self
        cell.post = post
        cell.configure_settings()
        cell.configure_post(with: post)
        cell.configure_user(with: mark)
        return cell
    }
    // когда ячейка выбрана
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
      //MARK: - configure
    func configure(){

        tableView.delegate = self
        tableView.dataSource = self
        TableViewGetData_()
        
    }
      //MARK: - Get Data
    func TableViewGetData_(){
        DataManager.sharedData.asyncGetUser { [weak self]user in
            self?.mark = user
        }
        
        DataManager.sharedData.asyncGetPosts { [weak self]post in
            self?.posts = post
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
      //MARK: -SearchContoller
    func configureSearchContoller(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Searching"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
    
        DataManager.sharedData.asynSearchPost(with: searchController.searchBar.text!) { filterPost in
            self.filterPost = filterPost
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


extension DetailViewController:DeleteDelegate{
    func deletePost(with post: Post) {
        let alertController = UIAlertController(title: "Delete", message: "Do you want delete this post?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self]action->Void in
            DataManager.sharedData.asyncDeletePost(with: post) { [weak self]posts in
                self?.posts = posts
                DispatchQueue.main.async {
                    self?.delegate?.deletePost(with: post)
                    self?.tableView.reloadData()
                }
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
