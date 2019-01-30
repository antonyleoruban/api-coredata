//
//  CoreDataModel.swift
//  Api-Coredata
//
//  Created by User6 on 30/01/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import UIKit
import CoreData

class CoreDataModel: NSObject {
    
    static let instanceShared = CoreDataModel()
    
    
    func Save() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Student", in: context)
        let managedObj = NSManagedObject(entity: entity!, insertInto: context)
        
        
        managedObj.setValue("Antony leo Ruban ", forKey: "name")
        managedObj.setValue("28", forKey: "age")
        managedObj.setValue("Sathy", forKey: "address")
        managedObj.setValue("3", forKey: "phoneno")
        
        do {
            try context.save()
        }
        catch{
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
    }
    
    func Fetch()
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        request.returnsObjectsAsFaults = false
        do {
            
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                print(data.value(forKey: "name") as! String)
                print(data.value(forKey: "phoneno") as! String)
                
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
    func FetchaData(phone : String)
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        request.predicate = NSPredicate(format: "phoneno = %@",phone)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
                print(data.value(forKey: "phoneno") as! String)
                
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
    func deleteContact(phone : String)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetchRequest.predicate = NSPredicate(format: "phoneno = %@",phone)
        fetchRequest.includesPropertyValues = false // Only fetch the managedObjectID (not the full object structure)
        
        //Delete
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                managedContext.delete(data)
            }
            
            do {
                try managedContext.save()
            }
            catch{
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        } catch {
            print("Failed")
        }
        
        // Save
        
        
        
        
    }
    
    func updateData(phone : String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetchRequest.predicate = NSPredicate(format: "phoneno = %@",phone)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            let managedObj = result[0] as!  NSManagedObject
            managedObj.setValue("Antony leo Ruban kkkkkkkkkk", forKey: "name")
            managedObj.setValue("28", forKey: "age")
            managedObj.setValue("Sathy", forKey: "address")
            do {
                try managedContext.save()
            }
            catch{
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            
            
            do {
                try managedContext.save()
            }
            catch{
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        } catch {
            print("Failed")
        }
        
    }
    
    
    
    func deleteUserInfoData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetchRequest.includesPropertyValues = false // Only fetch the managedObjectID (not the full object structure)
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                managedContext.delete(data)
            }
            do {
                try managedContext.save()
            }
            catch{
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        } catch {
            print("Failed")
        }
        
        
    }
    
}

