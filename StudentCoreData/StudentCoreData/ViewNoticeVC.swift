//
//  ViewNoticeVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewNoticeVC: UIViewController {
    
    private var noteArray = [Notice]()
    
    private let NoticeTable = UITableView()
    
    
    let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleadd))
    
    @objc func handleadd()
    {
        print("hanldeadd")
        let vc = NoticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteArray = CoreDataHandeler.shared.noticefetchbyclass(classes1: "TY")
        NoticeTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NOTICE"
        
        view.addSubview(NoticeTable)
        
        /*let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewEmployee))
        navigationItem.setRightBarButton(addItem, animated: true)*/
        
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NoticeTable.frame = view.bounds
    }
    
    /*@objc private func addNewEmployee() {
        print("addemp")
        let vc = NoticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }*/
    
}
extension ViewNoticeVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        NoticeTable.register(UITableViewCell.self, forCellReuseIdentifier: "notice")
        NoticeTable.delegate = self
        NoticeTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notice", for: indexPath)
        let nt = noteArray[indexPath.row]
        cell.textLabel?.text = "\(nt.title!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NoticeDetailVC()
        vc.notice = noteArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
