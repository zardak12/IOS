//
//  ViewController.swift
//  ToDoList
//
//  Created by Марк Шнейдерман on 20.02.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController,NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var fetchedResultController : NSFetchedResultsController<Item>!
    var tableView = UITableView()
    var dataManager = DataStoreManager()
    var task = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_up()
        dataManager.getAllItems { [weak self]item in
            self?.task = item
        }
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if indexPath != nil{
                tableView.insertRows(at: [indexPath!], with: .automatic)
            }
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .middle)
            default:
                break
            }
        }
    
    func set_up(){
        title = "Список продуктов"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.indetifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        // кнопка на навигатион бар
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didAdd))
    }

    @objc func didAdd(){
        //создали алерт
        let alert = UIAlertController(title: "Новая задача", message: "Добавим новую задачу", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { _ in
            if let field = alert.textFields?.first, let text = field.text {
                self.dataManager.createItem(name: text) { [weak self] items in
                    self?.task = items
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }else {return}
        }))
        let cancel = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.indetifier,for: indexPath) as! ItemTableViewCell
        let item = task[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertEdit =  UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Отмена", style: .destructive)
        let check = UIAlertAction(title: "Сделано", style: .default) { _ in
            if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }else{
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }
        }
        let edit = UIAlertAction(title: "Изменить", style: .default) { _ in
            let newAlert = UIAlertController(title: "Введите новую задачу:", message: "", preferredStyle: .alert)
            newAlert.addTextField(configurationHandler: nil)
            let ok = UIAlertAction(title: "OK", style: .cancel) { _ in
                if let field = newAlert.textFields?.first,let text = field.text {
                    self.dataManager.updateItem(item: self.task[indexPath.row], newName: text) { [weak self]items in
                        self?.task = items
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    }
                }
            }
            newAlert.addAction(ok)
            self.present(newAlert, animated: true)
        }
        alertEdit.addAction(check)
        alertEdit.addAction(edit)
        alertEdit.addAction(cancel)
        
        self.present(alertEdit, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataManager.deleteItem(item: task[indexPath.row]) { [weak self] items in
            self?.task = items
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
}
}
