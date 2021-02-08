//
//  SoupTableViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class SoupTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    var soup = [soupModel]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        appendSoup()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SoupTableViewCell") as! SoupTableViewCell
        let number = soup[indexPath.row]
        
        cell.soupImageView.image = number.photo
        cell.soupNameLabel.text = number.product
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // обработка нажатия
        tableView.deselectRow(at: indexPath, animated: true)// анимация перехода
        let argument = soup[indexPath.row] // текущий элемент
        performSegue(withIdentifier: "SoupRecipe", sender: argument)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SoupRecipe",let soup = sender as? soupModel{
            let new = segue.destination as! SoupRecipeViewController
            new.souprecipe = soup
        }
    }
    
    
    func appendSoup(){
        soup.append(soupModel(product: Product.borsh.rawValue, soupRecipe: SoupRecipe.borsh.rawValue, photo: UIImage(named: "borshh")!))
        soup.append(soupModel(product: Product.harcho.rawValue, soupRecipe: SoupRecipe.harcho.rawValue, photo: UIImage(named: "harcho")!))
        soup.append(soupModel(product: Product.soupChicken.rawValue, soupRecipe: SoupRecipe.soupChicken.rawValue, photo: UIImage(named: "kurinii_sup_s_chesnokom-614417")!))
    }
}
