//
//  ViewController.swift
//  StudentCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "admission")
        return imageView
    }()
    
    
    
    
    private let username: UITextField = {
        let usr = UITextField()
        
        usr.textAlignment = .center
        usr.autocapitalizationType = .none
        usr.autocorrectionType = .no
        usr.font = UIFont(name: "", size: 20.0)
        usr.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        usr.attributedPlaceholder = NSAttributedString(string: "USERNAME", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        usr.layer.cornerRadius = 20
        
        return usr
        
    } ()
    
    
    
    
    private let password: UITextField = {
        let psw = UITextField()
        //        psw.borderStyle = .roundedRect
        //text.backgroundColor = .systemFill
        psw.textAlignment = .center
        //        psw.textColor = .black
        //psw.placeholder = "Enter Password"
        psw.autocorrectionType = .no
        psw.font = UIFont(name: "", size: 20.0)
        psw.isSecureTextEntry = true
        psw.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        psw.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        psw.layer.cornerRadius = 20
        return psw
        
        
        
    } ()
    
    
    
    private let login : UIButton = {
        let con = UIButton()
        
        con.setTitle("Login", for: .normal)
        con.addTarget(self, action: #selector(logginTapped), for: .touchUpInside)
        // con.backgroundColor = .gray
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        con.backgroundColor = .black
        return con
        
        
    } ()
    
    @objc func logginTapped()
    {
       
        
        if(username.text == "admin" && password.text == "admin")
        {
            let vc = AdminVC()
            navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let uname = username.text!
            let upass = password.text!
            let temp = CoreDataHandeler.shared.checkLogin(uname: uname, password: upass)
            
            
            print("Temp\(temp)")
            
            if(temp == [Student]())
            {
                let alert = UIAlertController(title: "Alert", message: "Invalid User", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert,animated: true,completion: nil)
            }
            else{
                UserDefaults.standard.setValue(uname, forKey: "uname")
                let nav = StudVC()
                navigationController?.pushViewController(nav, animated: true)
            }
                    
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImageView)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(login)
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "5.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        self.view.backgroundColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame = CGRect(x: 160, y:view.safeAreaInsets.top + 30, width: 50, height: 50)
        username.frame = CGRect(x: 30, y: myImageView.bottom + 220 , width: view.width - 60, height: 40)
        password.frame = CGRect(x: 30, y: username.bottom + 5, width: view.width - 60, height: 40)
        login.frame = CGRect(x: 30, y: password.bottom + 20, width: view.width - 60, height: 40)
        
    }
}



