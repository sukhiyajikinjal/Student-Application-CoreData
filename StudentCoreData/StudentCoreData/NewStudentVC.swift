//
//  NewStudentVC.swift
//  StudentCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewStudentVC: UIViewController {
    var student:Student?
    
    private let spidTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "SPID"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        return textField
    }()
    private let passTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "pass"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        //textField.autocorrectionType = .no
        return textField
    }()
    
    private let ageTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Age"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let phoneTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone Number"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
   /* private let classesTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Classes"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()*/
    private let segment:UISegmentedControl = {
        let item = ["FY","SY","TY"]
        let s = UISegmentedControl(items: item)
        return s
    }()
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveEmpData), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(spidTextField)
        view.addSubview(nameTextField)
        view.addSubview(passTextField)
        view.addSubview(ageTextField)
        view.addSubview(phoneTextField)
        view.addSubview(segment)
        view.addSubview(saveButton)
        
      
        if let stud = student{
            spidTextField.text = stud.spid
            nameTextField.text = stud.name
            passTextField.text = stud.pass
            ageTextField.text = String(stud.age)
            phoneTextField.text = stud.phone
            if(stud.classes == "FY"){
                segment.selectedSegmentIndex = 0
                
            }
            if(stud.classes == "SY"){
                segment.selectedSegmentIndex = 1
                
            }
            if(stud.classes == "TY"){
                segment.selectedSegmentIndex = 2
                
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        spidTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        nameTextField.frame = CGRect(x: 40, y: spidTextField.bottom + 20, width: view.width - 80, height: 40)
        passTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 40)
        ageTextField.frame = CGRect(x: 40, y: passTextField.bottom + 20, width: view.width - 80, height: 40)
        phoneTextField.frame = CGRect(x: 40, y: ageTextField.bottom + 20, width: view.width - 80, height: 40)
        segment.frame = CGRect(x: 40, y: phoneTextField.bottom + 20, width: view.width - 80, height: 40)
        saveButton.frame = CGRect(x: 40, y: segment.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func saveEmpData() {
        let spid = spidTextField.text!
        let name = nameTextField.text!
        let pass = passTextField.text!
        let age = Int(ageTextField.text!)!
        let phone = phoneTextField.text!
        let classes = segment.titleForSegment(at: segment.selectedSegmentIndex)!
        
        if let stud = student{
            // UPDATE
            CoreDataHandeler.shared.update(stud: stud,spid: spid ,name: name, pass: pass, age: age, phone: phone, classes: classes){
                print("updated")
            }
        } else {
            // INSERT
            CoreDataHandeler.shared.insert(spid: spid,name: name, pass: pass, age: age, phone: phone, classes: classes){
                print("insert")
            }
        }
    }
  

}
