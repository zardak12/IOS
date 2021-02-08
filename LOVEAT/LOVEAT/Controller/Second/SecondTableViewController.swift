//
//  SecondTableViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class SecondTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var second = [secondModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        append_second()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return second.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
        let argument = second[indexPath.row]
        cell.secondImageView.layer.cornerRadius = 50
        cell.secondImageView.image = argument.photo
        cell.secondNameLabel.text = argument.product
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let argument = second[indexPath.row]
        performSegue(withIdentifier: "SecondRecipe", sender: argument)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondRecipe", let second = sender as? secondModel{
            let new = segue.destination as! SecondRecipeViewController
            new.recipe = second
        }
    }
    
    func append_second(){
        second.append(secondModel(product:productNameSecond.second_2.rawValue , secondRecipe: SecondRecipe.second_2.rawValue, photo: UIImage(named: "second_2")!))
        second.append(secondModel(product:productNameSecond.second_3.rawValue , secondRecipe: SecondRecipe.second_3.rawValue, photo: UIImage(named: "second_3")!))
        second.append(secondModel(product:productNameSecond.second_4.rawValue , secondRecipe: SecondRecipe.second_4.rawValue, photo: UIImage(named: "second_4")!))
        second.append(secondModel(product:productNameSecond.second_5.rawValue , secondRecipe: SecondRecipe.second_5.rawValue, photo: UIImage(named: "second_5")!))
        second.append(secondModel(product:productNameSecond.second_6.rawValue , secondRecipe: SecondRecipe.second_6.rawValue, photo: UIImage(named: "second_6")!))
        second.append(secondModel(product:productNameSecond.second_7.rawValue , secondRecipe: SecondRecipe.second_7.rawValue, photo: UIImage(named: "second_7")!))
        second.append(secondModel(product:productNameSecond.second_8.rawValue , secondRecipe: SecondRecipe.second_8.rawValue, photo: UIImage(named: "second_8")!))
        second.append(secondModel(product:productNameSecond.second_9.rawValue , secondRecipe: SecondRecipe.second_9.rawValue, photo: UIImage(named: "second_9")!))
        second.append(secondModel(product:productNameSecond.second_10.rawValue , secondRecipe: SecondRecipe.second_10.rawValue, photo: UIImage(named: "second_10")!))
        second.append(secondModel(product:productNameSecond.second_11.rawValue , secondRecipe: SecondRecipe.second_11.rawValue, photo: UIImage(named: "second_11")!))
        second.append(secondModel(product:productNameSecond.second_12.rawValue , secondRecipe: SecondRecipe.second_12.rawValue, photo: UIImage(named: "second_12")!))
    }
}
