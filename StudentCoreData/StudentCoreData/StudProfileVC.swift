//
//  StudProfileVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudProfileVC: UIViewController {
    var stud = [Student]()
    
    private let lblspid : UILabel = {
        let lbl = UILabel()
        lbl.text = "SPID"
        return lbl
    }()
    private let lblspidvalue : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        return lbl
    }()
    
    private let lblname : UILabel = {
        let lbl = UILabel()
        lbl.text = "Student Name"
        return lbl
    }()
    private let lblnamevalue : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        return lbl
    }()
    
    private let lblgender : UILabel = {
        let lbl = UILabel()
        lbl.text = "Password"
        return lbl
    }()
    private let lblgendervalue : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        return lbl
    }()
    
    private let lblclass : UILabel = {
        let lbl = UILabel()
        lbl.text = "Age"
        return lbl
    }()
    private let lblclassvalue : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        return lbl
    }()
    
    private let lbldob : UILabel = {
        let lbl = UILabel()
        lbl.text = "Classes"
        return lbl
    }()
    private let lbldobvalue : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        return lbl
    }()
   
    
  
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let spid : String  = UserDefaults.standard.string(forKey: "uname")!
        stud = CoreDataHandeler.shared.fetchprofile(spid: spid)
        
        lblspidvalue.text = stud[0].spid
        lblnamevalue.text = stud[0].name
        lblgendervalue.text = stud[0].pass
        lblclassvalue.text = "\(stud[0].age)"
        lbldobvalue.text = stud[0].classes
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lblspid)
        view.addSubview(lblspidvalue)
        
        view.addSubview(lblname)
        view.addSubview(lblnamevalue)
        
        view.addSubview(lbldob)
        view.addSubview(lbldobvalue)
        
        view.addSubview(lblgender)
        view.addSubview(lblgendervalue)
        
        view.addSubview(lblclass)
        view.addSubview(lblclassvalue)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lblspid.frame = CGRect(x: 20, y: 80, width: view.frame.size.width-40, height: 30)
        lblspidvalue.frame = CGRect(x: 20, y: 110, width: view.frame.size.width-40, height: 30)
        
        lblname.frame = CGRect(x: 20, y: 150, width: view.frame.size.width-40, height: 30)
        lblnamevalue.frame = CGRect(x: 20, y: 180, width: view.frame.size.width-40, height: 30)
        
        lbldob.frame = CGRect(x: 20, y: 230, width: view.frame.size.width-40, height: 30)
        lbldobvalue.frame = CGRect(x: 20, y: 260, width: view.frame.size.width-40, height: 30)
        
        lblgender.frame = CGRect(x: 20, y: 310, width: view.frame.size.width-40, height: 30)
        lblgendervalue.frame = CGRect(x: 20, y: 340, width: view.frame.size.width-40, height: 30)
        
        lblclass.frame = CGRect(x: 20, y: 380, width: view.frame.size.width-40, height: 30)
        lblclassvalue.frame = CGRect(x: 20, y: 410, width: view.frame.size.width-40, height: 30)
        
        
    }
    

  

}
