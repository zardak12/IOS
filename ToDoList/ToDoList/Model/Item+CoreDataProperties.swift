//
//  Item+CoreDataProperties.swift
//  ToDoList
//
//  Created by Марк Шнейдерман on 20.02.2021.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?

}

extension Item : Identifiable {

}
