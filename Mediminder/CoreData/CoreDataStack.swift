//
//  CoreDataStack.swift
//  Mediminder
//
//  Created by Kaari Strack on 21/03/2018.
//  Copyright © 2018 HSJK. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "Medication")
        container.loadPersistentStores { (description, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
        }
        return container
    }
    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }
}
