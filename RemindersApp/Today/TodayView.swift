//
//  TodayView.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 31/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayView: UIView {
    let tableView: UITableView
    
    override init(frame: CGRect) {
        tableView = UITableView()
        
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
