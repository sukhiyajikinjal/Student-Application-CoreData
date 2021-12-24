//
//  AdminVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AdminVC: UIViewController {

    private let add:UIButton = {
        let button = UIButton()
        button.setTitle("Add Student", for: .normal)
        button.addTarget(self, action: #selector(addstud), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        return button
    }()
    
    
    
    
    private let noticeBoard:UIButton = {
        let button = UIButton()
        button.setTitle("Notice", for: .normal)
       button.addTarget(self, action: #selector(note), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    private let find:UIButton = {
        let button = UIButton()
        button.setTitle("Find Student", for: .normal)
        button.addTarget(self, action: #selector(findstud), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        return button
    }()
    @objc private func findstud(){
        let asvc = FindStudVC()
        navigationController?.pushViewController(asvc, animated: true)
    }
    @objc private func addstud(){
        let asvc = StudentVC()
        navigationController?.pushViewController(asvc, animated: true)
    }
    
    
    private let logout_btn:UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    
   @objc private func note(){
        let nt = NoticeVC()
        navigationController?.pushViewController(nt, animated: true)
    }
    
    
    @objc private func logoutTapped(){
        
        //        UserDefaults.standard.setValue(nil, forKey: "sesionAdmin")
        //        UserDefaults.standard.setValue(nil, forKey: "admin")
        
        let lv = ViewController()
        navigationController?.pushViewController(lv, animated: true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // print(adminToken)
        print("now into the admin page")
        
        view.addSubview(add)
        view.addSubview(noticeBoard)
        view.addSubview(find)
        view.addSubview(logout_btn)
        self.view.backgroundColor = .white
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "2.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        add.frame = CGRect(x: 40, y: 250, width: view.width - 80, height: 60)
        noticeBoard.frame = CGRect(x: 40, y: add.bottom + 10,  width: view.width - 80, height: 60)
        find.frame = CGRect(x: 40, y: noticeBoard.bottom + 10,  width: view.width - 80, height: 60)
        logout_btn.frame = CGRect(x: 40, y: find.bottom + 10,  width: view.width - 80, height: 60)
    }
    


}
