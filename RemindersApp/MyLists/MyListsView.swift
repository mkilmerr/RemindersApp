//
//  MyListsView.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 30/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class MyListsView: UIView {
    let tableView: UITableView
    
    override init(frame: CGRect) {
        
        tableView = UITableView()
        super.init(frame: frame)
        addSubviewWithAutoLayout(tableView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

