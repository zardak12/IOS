//
//  ViewController.swift
//  Shneiderman_Mark
//
//  Created by Марк Шнейдерман on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var avaImageView: UIImageView!
    @IBOutlet weak var companyPickerView: UIPickerView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companySymbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
      //MARK: -Data
    private lazy var companies = [
        "Apple" : "AAPL",
        "Microsoft":"MSFT",
        "Google":"GOOG",
        "Amazon":"AMZN",
        "Facebook":"FB"
    ]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyNameLabel.text = "Tinkof"
        
        companyPickerView.dataSource = self
        companyPickerView.delegate = self
        
        activityIndicator.hidesWhenStopped = true
        
        requestQuoteUpdate()
        
    }



    
    private func requestQuoteUpdate(){
        activityIndicator.startAnimating()
        companyNameLabel.text = "-"
        companySymbolLabel.text = "-"
        priceLabel.text = "-"
        priceChangeLabel.text = "-"
        avaImageView.image = .none
        priceChangeLabel.textColor = UIColor.black
        let selectedRow = companyPickerView.selectedRow(inComponent: 0)
        let selectedSymbol = Array(companies.values)[selectedRow]
        requestQuote(for: selectedSymbol)
        
    }
    private func requestQuote(for symbol:String){
        let token = "pk_068abb7b946940e39c20f9362ff42bd0"
        guard let url = URL(string: "https://cloud.iexapis.com/stable/stock/\(symbol)/quote?token=\(token)")else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url){[weak self](data,responce,error) in
            if let data = data,
               (responce as? HTTPURLResponse)?.statusCode == 200,
               error == nil {
                guard let imageUrl = URL(string: "https://storage.googleapis.com/iex/api/logos/\(symbol).png?token=\(token)")else{return}
                self?.parseQuote(from:data,imageUrl:imageUrl)
            }
            else {
                if (responce as? HTTPURLResponse)?.statusCode != 200{
                    DispatchQueue.main.async {
                        self?.alertError(with: "404 Not Found", with: "Network Error")
                        }
                } else if (data == nil){
                    DispatchQueue.main.async {
                        self?.alertError(with: "Json пуст", with: "")
                    }
                }else {
                    DispatchQueue.main.async {
                        self?.alertError(with: "Error", with: "")
                    }
                }
                print("Network error!")
            }
        }
        dataTask.resume()
    }
    
    private func parseQuote(from data:Data,imageUrl:URL){
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            guard
                let json = jsonObject as? [String:Any],
                let companyName = json["companyName"] as? String,
                let companySymbol = json["symbol"] as? String,
                let price = json["latestPrice"] as? Double,
                let priceChange = json["change"] as? Double else {return}
            
            DispatchQueue.main.async { [weak self] in
                self?.displayStockInfo(companyName:companyName,
                                       companySymbol:companySymbol,
                                       price:price,
                                       priceChange:priceChange,imageUrl:imageUrl)
            }
        }catch{
            print("JSON parsing error " + error.localizedDescription)
        }
    }
    
    private func displayStockInfo(companyName:String,companySymbol:String,price:Double,priceChange:Double,imageUrl:URL){
        activityIndicator.stopAnimating()
        companyNameLabel.text = companyName
        companySymbolLabel.text = companySymbol
        priceLabel.text = "\(price)"
        selectColorPrice(with:priceChange)
        priceChangeLabel.text = "\(priceChange)"
        // загружаем картинку (2 пункт)
        avaImageView.downloaded(from: imageUrl)
    }
    
    private func selectColorPrice(with price : Double){
        if price < 0{
            priceChangeLabel.textColor = UIColor.red
        }
        else if price > 0 {
            priceChangeLabel.textColor = UIColor.green
        }
        else{
            priceChangeLabel.textColor = UIColor.black
        }
    }
    
    private func alertError(with alert_title: String, with alert_message: String) {
        let alertController = UIAlertController(title: alert_title, message: alert_message, preferredStyle: .alert)
        
        let OkAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(OkAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}



extension ViewController : UIPickerViewDataSource{
    //метод должен вернуть Int соответствующий числу компонент (вертикальных крутилок) нашего пикера
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        companies.keys.count
    }

}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        requestQuoteUpdate()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(companies.keys)[row]
    }
    
}



