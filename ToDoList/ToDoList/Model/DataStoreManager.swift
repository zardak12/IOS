//
//  DataStoreManager.swift
//  ToDoList
//
//  Created by Марк Шнейдерман on 20.02.2021.
//

import Foundation
import CoreData

class DataStoreManager:NSObject,NSFetchedResultsControllerDelegate{

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
    
        // Чтобы создать экземпляр вашего ManagedObject(Entity) олжны обратиться к своему NSPersistentContainer
        // который является оберткой для вашего NSPersistentStoreCoordinator
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var  viewContext: NSManagedObjectContext = persistentContainer.viewContext
    
    var fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

      //MARK: - Простой варинат
    
    func  getAllItems(completion:([Item])->Void){
        do{
            guard let items = try? viewContext.fetch(Item.fetchRequest()) as [Item] else {return}
            completion(items)
        }
    }
    
    func createItem(name:String,completion : ([Item])->Void){
        let item = Item(context: viewContext)
        item.name =  name
        saveContext()
        guard let items = try? viewContext.fetch(Item.fetchRequest()) as [Item] else {
            return
        }
        completion(items)
    }
    
    
    
    func deleteItem(item : Item, completion:([Item])-> Void){
        viewContext.delete(item)
        saveContext()
        guard let items = try? viewContext.fetch(Item.fetchRequest()) as [Item] else {return}
        completion(items)
    }
    
    func updateItem(item: Item, newName : String,completion :([Item])->Void){
        item.name = newName
        saveContext()
        guard let items = try? viewContext.fetch(Item.fetchRequest()) as [Item] else {
            return
        }
        completion(items)
    }

}

