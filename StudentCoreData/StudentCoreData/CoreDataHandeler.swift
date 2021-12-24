//
//  CoreDataHandeler.swift
//  StudentCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHandeler {
    static let shared = CoreDataHandeler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let manageObjectContext: NSManagedObjectContext?
    
    private init(){
        manageObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        
        appDelegate.saveContext()
    }
    
    
    func insert(spid:String,name: String, pass:String, age: Int,phone:String,classes:String, completion: @escaping () -> Void){
        let stud = Student(context: manageObjectContext!)
        stud.spid = spid
        stud.name = name
        stud.pass = pass
        stud.age = Int64(age)
        stud.phone = phone
        stud.classes = classes
        
        save()
        completion()
    }
    
    func update(stud: Student,spid:String,name: String,pass:String,age: Int,phone:String,classes:String, completion: @escaping () -> Void){
        stud.spid = spid
        stud.name = name
        stud.pass = pass
        stud.age = Int64(age)
        stud.phone = phone
        stud.classes = classes
       
        save()
        completion()
    }
    
    func delete(stud: Student, completion: @escaping () -> Void){
        
        manageObjectContext!.delete(stud)
        
        save()
        completion()
    }
    
    func fetch() -> [Student]{
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let studArray = try manageObjectContext?.fetch(fetchRequest)
            return studArray!
        } catch {
            print(error)
            return [Student]()
        }
    }
    
    //---------NOTICE--------
    func savenote(){
        
        appDelegate.saveContext()
    }
    
    
    func insertnote(title:String,div: String, desc:String, completion: @escaping () -> Void){
        let note = Notice(context: manageObjectContext!)
        note.title = title
        note.div = div
        note.desc = desc
       
        savenote()
        completion()
    }
    
    func updatenote(note: Notice,title:String,div: String,desc:String, completion: @escaping () -> Void){
        note.title = title
        note.div = div
        note.desc = desc
        
        savenote()
        completion()
    }
    
    func deletenote(note: Notice, completion: @escaping () -> Void){
        
        manageObjectContext!.delete(note)
        
        savenote()
        completion()
    }
    
    func fetch() -> [Notice]{
        let fetchRequest:NSFetchRequest<Notice> = Notice.fetchRequest()
        do{
            let noticeArray = try manageObjectContext?.fetch(fetchRequest)
            return noticeArray!
        } catch {
            print(error)
            return [Notice]()
        }
    }
    
    func fetchbyclass(classes1 : String) -> [Student]
    {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            fetchRequest.predicate = NSPredicate(format: "classes == %@",classes1)
            
            
            let studarray = try manageObjectContext?.fetch(fetchRequest)
            return studarray!
        }catch{
            print(error)
            return [Student]()
        }
    }
    
    func checkLogin(uname : String,password : String) -> [Student]
    {
        
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            //fetchRequest.predicate = NSPredicate(format: "spid == %@",uname)
            
            let p1 = NSPredicate(format: "spid == %@",uname)
            let p2 = NSPredicate(format: "pass == %@",password)
            
            fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [p1,p2])
            
            let studarray = try manageObjectContext?.fetch(fetchRequest)
            return studarray!
        }catch{
            print(error)
            return [Student]()
        }
    }
    
    func fetchprofile(spid : String) -> [Student]
    {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            fetchRequest.predicate = NSPredicate(format: "spid == %@",spid)
            
            let studarray = try manageObjectContext?.fetch(fetchRequest)
            return studarray!
        }catch{
            print(error)
            return [Student]()
        }
    }
   
    
    func changepassword(stud: Student,password : String ,completion: @escaping () -> Void)
    {
        stud.pass = password
        save()
        completion()
    }
    
    
    func noticefetchbyclass(classes1 : String) -> [Notice]
    {
        let fetchRequest:NSFetchRequest<Notice> = Notice.fetchRequest()
        do{
            fetchRequest.predicate = NSPredicate(format: "div == %@",classes1)
            
            
            let notearray = try manageObjectContext?.fetch(fetchRequest)
            return notearray!
        }catch{
            print(error)
            return [Notice]()
        }
    }
}
