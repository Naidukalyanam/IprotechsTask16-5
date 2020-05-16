

import UIKit
import CoreData
extension UIViewController
{
    func toAddItemInCoredata(userId : String, orderDate : String, orderNumber : String, customerName : String, customerPhoneNumber : String , customerAddress : String)
    {
       
        let entity = NSEntityDescription.entity(forEntityName: "Cart", in: context)
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        
        
        person.setValue(orderNumber, forKeyPath: "orderNumber")
        person.setValue(orderDate, forKeyPath: "orderDate")
          person.setValue(userId, forKeyPath: "userId")
         // person.setValue(orderNumber, forKeyPath: "orderNumber")
          person.setValue(customerName, forKeyPath: "customerName")
          person.setValue(customerPhoneNumber, forKeyPath: "customerPhoneNumber")
          person.setValue(customerAddress, forKeyPath: "customerAddress")
       
        do {
            try context.save()
           // let array1 = getDataFromCoreData()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func AddUser(userName : String, password : String , userid : String )
    {
        let entity = NSEntityDescription.entity(forEntityName: "Login", in: context)
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        person.setValue(userName, forKeyPath: "userName")
               person.setValue(password, forKeyPath: "password")
        person.setValue(password, forKeyPath: "userid")
        
        do {
                   try context.save()
                  // let array1 = getDataFromCoreData()
               } catch let error as NSError {
                   print("Could not save. \(error), \(error.userInfo)")
               }
        
    }
    
    func updateItemInCoreData(userId : String , orderDate  : String , positionValue : NSInteger ,orderNumber : String ,customerName : String,customerPhoneNumber : String ,customerAddress :String)
        
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            let object : NSManagedObject = result[positionValue] as! NSManagedObject
            object.setValue(orderNumber , forKey: "orderNumber")
            object.setValue(orderDate , forKey: "orderDate")
            object.setValue(userId , forKey: "userId")
            object.setValue(customerAddress , forKey: "customerAddress")
            object.setValue(customerPhoneNumber , forKey: "customerPhoneNumber")
            object.setValue(customerName , forKey: "customerName")
          //  object.setValue(product_id , forKey: "product_id")
            
            appDelegate.saveContext()
        }
        catch
        {
        }
        // NSArray*Array=[context executeFetchRequest:fetchRequest error:nil];
        //NSManagedObject* object = [Array objectAtIndex:postion];
    }
    func delectAllElements()
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for item in result
            {
               // let object : NSManagedObject = result[position] as! NSManagedObject
                context.delete(item as! NSManagedObject)
            }
            
        }
        catch
        {
            
        }
    }
    func delectItemFromCart( position : NSInteger)
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            let object : NSManagedObject = result[position] as! NSManagedObject
            context.delete(object)
        }
        catch
        {
            
        }
        
    }
    
    func getDataFromCoreData() -> [NSDictionary]
    {
        var dataInCart = [NSDictionary]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            
            for data in result as! [NSManagedObject] {
                let dataDic = NSMutableDictionary()
                dataDic.setValue((data.primitiveValue(forKey: "orderNumber") ?? ""), forKey: "orderNumber")
                 dataDic.setValue((data.primitiveValue(forKey: "orderDate") ?? ""), forKey: "orderDate")
                 dataDic.setValue((data.primitiveValue(forKey: "userId") ?? ""), forKey: "userId")
                 dataDic.setValue((data.primitiveValue(forKey: "customerAddress") ?? ""), forKey: "customerAddress")
                 dataDic.setValue((data.primitiveValue(forKey: "customerPhoneNumber") ?? ""), forKey: "customerPhoneNumber")
                 dataDic.setValue((data.primitiveValue(forKey: "customerName") ?? ""), forKey: "customerName")
               //  dataDic.setValue((data.primitiveValue(forKey: "orderNumber") ?? ""), forKey: "orderNumber")
                
                dataInCart.append(dataDic)
                
            }
            print("==============\(dataInCart.count)============")
        } catch {
            print(error)
            print("Failed")
        }
        return dataInCart
    }
    
    
    func getUserDataFromCoreData() -> [NSDictionary]
    {
        var dataInCart = [NSDictionary]()
               let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Login")
               request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            
            for data in result as! [NSManagedObject] {
                let dataDic = NSMutableDictionary()
                dataDic.setValue((data.primitiveValue(forKey: "userName") ?? ""), forKey: "userName")
                 dataDic.setValue((data.primitiveValue(forKey: "password") ?? ""), forKey: "password")
                dataDic.setValue((data.primitiveValue(forKey: "userid") ?? ""), forKey: "userid")
                
                dataInCart.append(dataDic)
                
            }
            print("==============\(dataInCart.count)============")
        } catch {
            print(error)
            print("Failed")
        }
        return dataInCart
    }
    
}
