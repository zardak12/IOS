//
//  AdviceTableViewController.swift
//  LOVEAT
//
//  Created by Марк Шнейдерман on 21.10.2020.
//

import UIKit

class AdviceTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var advice = [adviceModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addUser()
    }

    func addUser(){
        advice.append(adviceModel(advice_name: AdviceName.advice_name_1.rawValue, advice: Advice.advice_1.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_2.rawValue, advice: Advice.advice_2.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_3.rawValue, advice: Advice.advice_3.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_4.rawValue, advice: Advice.advice_4.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_5.rawValue, advice: Advice.advice_5.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_6.rawValue, advice: Advice.advice_6.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_7.rawValue, advice: Advice.advice_7.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_8.rawValue, advice: Advice.advice_8.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_9.rawValue, advice: Advice.advice_9.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_10.rawValue, advice: Advice.advice_10.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_11.rawValue, advice: Advice.advice_11.rawValue))
        advice.append(adviceModel(advice_name: AdviceName.advice_name_12.rawValue, advice: Advice.advice_12.rawValue))

        tableView.estimatedRowHeight = 100
    }
}

extension AdviceTableViewController:UITableViewDelegate,UITableViewDataSource {
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "advice") as! AdviceTableViewCell
        let number = advice[indexPath.row]
        cell.selectionStyle = .none
        cell.adviceNameLabel.text = number.advice_name
        cell.adviceLabel.text = number.advice
        
        return cell
    }
    
    
}
