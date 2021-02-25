//
//  ItemTableViewCell.swift
//  ToDoList
//
//  Created by Марк Шнейдерман on 20.02.2021.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    static let indetifier = "CellIndetfier"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
