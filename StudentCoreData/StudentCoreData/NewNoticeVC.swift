//
//  NewNoticeVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewNoticeVC: UIViewController {

    var notice:Notice?
    
    private let titleTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "TITLE"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    private let segment:UISegmentedControl = {
        let item = ["FY","SY","TY"]
        let s = UISegmentedControl(items: item)
        return s
    }()
    private let descTextField:UITextField = {
        let textView = UITextField()
        textView.placeholder = "Desc"
        textView.textAlignment = .center
        textView.borderStyle = .roundedRect
        textView.backgroundColor = .gray
        return textView
    }()
    
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(savenoticeData), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(titleTextField)
        view.addSubview(segment)
        view.addSubview(descTextField)
        view.addSubview(saveButton)
        
        
        if let note = notice{
            titleTextField.text = note.title
            
            if(note.div == "FY"){
                segment.selectedSegmentIndex = 0
                
            }
            if(note.div == "SY"){
                segment.selectedSegmentIndex = 1
                
            }
            if(note.div == "TY"){
                segment.selectedSegmentIndex = 2
                
            }
            descTextField.text = note.desc
        }
      
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        segment.frame = CGRect(x: 40, y: titleTextField.bottom + 20, width: view.width - 80, height: 40)
        descTextField.frame = CGRect(x: 40, y: segment.bottom + 20, width: view.width - 80, height: 40)
        saveButton.frame = CGRect(x: 40, y: descTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func savenoticeData() {
        let title = titleTextField.text!
        let classes = segment.titleForSegment(at: segment.selectedSegmentIndex)!
        let desc = descTextField.text!
       
        
        
        if let note = notice{
            // UPDATE
            CoreDataHandeler.shared.updatenote(note: note, title: title, div:classes , desc: desc){
                print("updated")
            }
        } else {
            // INSERT
            CoreDataHandeler.shared.insertnote(title: title , div: classes, desc: desc){
                print("insert")
            }
        }
    }

}
