//
//  ViewController.swift
//  VK_NEWS
//
//  Created by Марк Шнейдерман on 30.12.2020.
//

import UIKit

//tableView.estimatedRowHeight = 50


class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
        
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var head: UIImageView!
    

    @IBOutlet weak var myPhotoButton: UIButton!
    
    
    
    var model = [UserModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        // потом изменим
        head.image = #imageLiteral(resourceName: "news")
        myPhotoButton.layer.cornerRadius = 0.5 * myPhotoButton.bounds.size.width
        myPhotoButton.clipsToBounds = true
        appendMark()
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        let number = model[indexPath.row]
        cell.avaPublicImageView.layer.cornerRadius = 0.5 * cell.avaPublicImageView.bounds.size.width
        cell.avaPublicImageView.image = number.ava
        cell.additionalImageView.image = number.photo
        cell.namePublicLabel.text = number.name
        cell.storyLabel.text = number.text
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let argument = model[indexPath.row]
        performSegue(withIdentifier: "Go", sender: argument)// метод делающий переход
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Go", let news = sender as? UserModel{
            let dest = segue.destination as! DetailViewController
            dest.user = news
        }
    }
 
    
    
    func appendMark(){
        model.append(UserModel(ava: #imageLiteral(resourceName: "public_1"), name: name_Mark.name_1.rawValue, text: text_Mark.text_1.rawValue, photo: #imageLiteral(resourceName: "прогрммист_доп_1")))
        model.append(UserModel(ava: #imageLiteral(resourceName: "ава_реалист"), name: name_Mark.name_2.rawValue, text: text_Mark.text_2.rawValue, photo: #imageLiteral(resourceName: "реалист_доп_1")))
        model.append(UserModel(ava: #imageLiteral(resourceName: "индвивдуалист_ава"), name: name_Mark.name_3.rawValue, text: text_Mark.text_3.rawValue, photo: #imageLiteral(resourceName: "похуй как называется")))
        model.append(UserModel(ava: #imageLiteral(resourceName: "5_умных_мыслей_ава"), name: name_Mark.name_4.rawValue, text: text_Mark.text_4.rawValue, photo: #imageLiteral(resourceName: "5_умных_мыслей_доп_1")))
        model.append(UserModel(ava: #imageLiteral(resourceName: "словарный_запас_ава"), name: name_Mark.name_5.rawValue, text: text_Mark.text_5.rawValue, photo: #imageLiteral(resourceName: "словарный_запас_доп_1")))
    }
    
    
    
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func myPhotoActionButton(_ sender: Any) {
    }
    
    
}

