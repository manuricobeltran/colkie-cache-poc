//
//  Persistence.swift
//  Project
//
//  Created by Manu Rico on 7/11/22.
//

import CoreData

protocol PersistenceController {
    var container: NSPersistentContainer { get }
}

class PersistenceControllerDefault: PersistenceController {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Cache")
        
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.name = "viewContext"
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
    }
}
