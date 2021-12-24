//
//  StudVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudVC: UIViewController {

 
   

    private let add:UIButton = {
        let button = UIButton()
        button.setTitle("Student Profile", for: .normal)
        button.addTarget(self, action: #selector(GoToProf), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        return button
    }()
    @objc public func GoToProf()
        {
            //print("SPID" + UserDefaults.standard.string(forKey: "uname")!)
            let nav = StudProfileVC()
            navigationController?.pushViewController(nav, animated: true)
 
        }
    
    
    
    private let noticeBoard:UIButton = {
        let button = UIButton()
        button.setTitle("Notice Board", for: .normal)
        button.addTarget(self, action: #selector(GoToNotice), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    @objc public func GoToNotice()
     {
     let vc = ViewNoticeVC()
     navigationController?.pushViewController(vc, animated: true)
     }
    private let find:UIButton = {
        let button = UIButton()
        button.setTitle("Change Passsword", for: .normal)
       button.addTarget(self, action: #selector(changepass), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        return button
    }()
   
    @objc private func changepass(){
        let asvc = ChangepassVC()
        navigationController?.pushViewController(asvc, animated: true)
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
       // logout_btn.frame = CGRect(x: 40, y: find.bottom + 10,  width: view.width - 80, height: 60)
}
}



