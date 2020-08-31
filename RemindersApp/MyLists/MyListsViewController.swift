//
//  MyListsViewController.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 30/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class MyListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let myListsView = MyListsView()
    
    override func loadView() {
        view = myListsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        
    }
    
}

//MARK:- REGISTER TABLE VIEW CELL

extension MyListsViewController {
    func registerCell() {
        myListsView.tableView.delegate = self
        myListsView.tableView.dataSource = self
        myListsView.tableView.register(MyListsTableViewCell.self, forCellReuseIdentifier: MyListsTableViewCell.cellIdentifier)
        
    }
}

//MARK:- TABLE VIEW METHODS

extension MyListsViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyListsTableViewCell.cellIdentifier , for: indexPath) as! MyListsTableViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
   
}

