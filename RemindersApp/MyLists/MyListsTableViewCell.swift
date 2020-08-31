//
//  MyListsTableViewCell.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 30/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class MyListsTableViewCell: UITableViewCell {
    
    
    lazy var categorieImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "calendar")
        image.tintColor = UIColor.label
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return image
    }()
    
    lazy var categorieName: UILabel = {
        let label = UILabel()
        label.text = "Categorie Name"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.categorieImage, self.categorieName])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    static var  cellIdentifier = "MyListsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.systemBackground.withAlphaComponent(0.1)
        //layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
       
//        layer.shadowOpacity = 0.5
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- SETUP COMPONENTS

extension MyListsTableViewCell {
    func setupComponents() {
        addSubview(stackView)
        
    }
}

//MARK:- SETUP CONSTRAINTS

extension MyListsTableViewCell {
    func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
        
        NSLayoutConstraint.activate([
            categorieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            categorieImage.topAnchor.constraint(equalTo: self.topAnchor),
            categorieImage.widthAnchor.constraint(equalToConstant: 30),
            categorieImage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
