//
//  FindStudVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class FindStudVC: UIViewController {

    private let lblclass : UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Semester"
        return lbl
    }()
    private let txtclass : UITextField = {
        let txt = UITextField()
        txt.placeholder = ""
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        return txt
    }()
    
    private let btnfind:UIButton={
        let btn1 = UIButton()
        btn1.setTitle("FIND", for: .normal)
        btn1.backgroundColor = .lightGray
        btn1.layer.cornerRadius = 10
        btn1.addTarget(self, action: #selector(se),for: .touchUpInside)
        return btn1
        
    }()
    
    @objc func se()
    {
        print("click")
        let s = txtclass.text!
        studArray = CoreDataHandeler.shared.fetchbyclass(classes1: s)
        StudentTable.reloadData()
    }
    
    private let StudentTable = UITableView()
    
    private var studArray = [Student]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        studArray = CoreDataHandeler.shared.fetch()
        StudentTable.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lblclass)
        view.addSubview(txtclass)
        view.addSubview(btnfind)
        view.addSubview(StudentTable)
        StudentTable.dataSource = self
        StudentTable.delegate = self
        StudentTable.register(UITableViewCell.self, forCellReuseIdentifier: "StudentCell")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lblclass.frame = CGRect(x: 20, y: 70, width: view.frame.size.width-40, height: 30)
        txtclass.frame = CGRect(x: 20, y: 110, width: view.frame.size.width-40, height: 30)
        btnfind.frame = CGRect(x: 20, y: 160, width: view.frame.size.width-40, height: 30)
        StudentTable.frame = CGRect(x : 0,y: view.safeAreaInsets.top+150,width: view.frame.size.width,height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        
    }}
extension FindStudVC: UITableViewDataSource , UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell",for: indexPath)
        let stud = studArray[indexPath.row]
        cell.textLabel?.text = "\(stud.spid!) \t | \(stud.name!) \t | \t \(stud.classes!)"
        return cell
        
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Add_Student()
        vc.stud = MyStudentArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Student Names"
    }
    

}
