//
//  NoticeVC.swift
//  StudentCoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController {
    private var noteArray = [Notice]()
    
    private let noteTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteArray = CoreDataHandeler.shared.fetch()
        noteTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notice Board"
        
        view.addSubview(noteTableView)
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewNotice))
        navigationItem.setRightBarButton(addItem, animated: true)
        
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        noteTableView.frame = view.bounds
    }
    
    @objc private func addNewNotice() {
        let vc = NewNoticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NoticeVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        noteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "note")
        noteTableView.delegate = self
        noteTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        let note = noteArray[indexPath.row]
        //cell.textLabel?.text = "\(stud.spid!)"
        cell.textLabel?.text = "\(note.title!) \t | \t \(note.div!) \t | \t \(note.desc!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NewNoticeVC()
        vc.notice = noteArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let note = noteArray[indexPath.row]
        CoreDataHandeler.shared.deletenote(note: note){
            self.noteArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        // let emp = empArray[indexPath.row]
        
        
    }
}
