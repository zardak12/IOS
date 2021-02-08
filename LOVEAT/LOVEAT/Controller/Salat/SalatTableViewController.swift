//
//  SalatTableViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class SalatTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var salat = [salatModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        appendSalat()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalatTableViewCell") as! SalatTableViewCell
        
        let number = salat[indexPath.row]
        cell.salatimageView.layer.borderWidth = 3.0
        cell.salatimageView.image = number.photo
        cell.salatNameLabel.text = number.product
        return cell
    }
    
  
    //didSelectRowAt не путать с didDeselect!!!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let argument = salat[indexPath.row]
        performSegue(withIdentifier: "SalatRecipe", sender: argument)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SalatRecipe", let salat = sender as? salatModel {
            let vesta = segue.destination as! SalatRecipeViewController
            vesta.recipe = salat
        }
    }
    
    func appendSalat(){
        salat.append(salatModel(product: productNameSalat.name_1.rawValue , salatRecipe: salatRecipe.salat_1.rawValue, photo: UIImage(named: "salat_1")!))
        salat.append(salatModel(product: productNameSalat.name_2.rawValue , salatRecipe: salatRecipe.salat_2.rawValue, photo: UIImage(named: "salat_2")!))
        salat.append(salatModel(product: productNameSalat.name_3.rawValue , salatRecipe: salatRecipe.salat_3.rawValue, photo: UIImage(named: "salat_3")!))
        salat.append(salatModel(product: productNameSalat.name_4.rawValue , salatRecipe: salatRecipe.salat_4.rawValue, photo: UIImage(named: "salat_4")!))
        salat.append(salatModel(product: productNameSalat.name_5.rawValue , salatRecipe: salatRecipe.salat_5.rawValue, photo: UIImage(named: "salat_10")!))
        
        
    }


}
