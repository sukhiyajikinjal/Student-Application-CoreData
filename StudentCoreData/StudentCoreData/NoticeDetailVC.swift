//
//  NoticeDetailVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NoticeDetailVC: UIViewController {

    var notice:Notice?
    
    private let lblnoticetitlevalue : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        return lbl
    }()
    
    
    private let lblnotice : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.numberOfLines = 50
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lblnoticetitlevalue)
        view.addSubview(lblnotice)
        
        if let nt = notice {
            lblnoticetitlevalue.text = nt.title
            lblnotice.text = nt.desc
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lblnoticetitlevalue.frame = CGRect(x: 20, y: 80, width: view.frame.size.width-40, height: 30)
        lblnotice.frame = CGRect(x: 20, y: 120, width: view.frame.size.width, height: 30)
    }
}
