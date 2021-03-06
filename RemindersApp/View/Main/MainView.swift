//
//  MainView.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 29/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let todayView = CategoriesView(imageName: "calendar", counter: "0", name: "Hoje")
    let scheduledView = CategoriesView(imageName: "calendar", counter: "10", name: "Programados")
    let allView = CategoriesView(imageName: "calendar", counter: "7", name: "Todos")
    let flaggedView = CategoriesView(imageName: "calendar", counter: "1", name: "Sinalizados")
    let myListsView =  MyListsView()
    
    lazy var firstStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.todayView,self.scheduledView])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var secondStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.allView,self.flaggedView])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var addListButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add List", for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .systemBackground

        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//MARK:- SETUP SUBVIEWS

extension MainView {
    
    func setupComponents() {
        
        addSubview(firstStackView)
        addSubview(secondStackView)
        addSubviewWithAutoLayout(addListButton)
        addSubview(myListsView.tableView)
        
    }
}
//MARK:- SETUP CONSTRAINTS

extension MainView {
    
    func setupConstraints() {
        //        NSLayoutConstraint.activate([
        //            todayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        //            todayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        //        ])
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 150),
            firstStackView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            firstStackView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            firstStackView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo:firstStackView.bottomAnchor,constant: 10),
            secondStackView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            secondStackView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            secondStackView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
        
        
        NSLayoutConstraint.activate([
            myListsView.tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myListsView.tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myListsView.tableView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 10),
            myListsView.tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addListButton.bottomAnchor.constraint(equalTo: self.myListsView.tableView.bottomAnchor, constant: -9),
            addListButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
        ])
    }
}

