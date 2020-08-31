//
//  NewListView.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 31/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class NewListView: UIView {
    
    lazy var cancelButton: UIButton =  {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        return button
    }()
    
    lazy var newListTextTitle: UILabel = {
        let label = UILabel()
        label.text = "New List"
        
        return label
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        return button
    }()
    
    lazy var headerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.cancelButton, self.newListTextTitle, self.doneButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 100
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var categorieImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "list")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var backgroundCategorieImage: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.backgroundColor = .red
        
        return view
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

//MARK:- SETUP UI COMPONENTS

extension NewListView {
    func setupComponents() {
        addSubview(headerStackView)
        backgroundCategorieImage.addSubview(categorieImage)
        addSubviewWithAutoLayout(backgroundCategorieImage)
    }
}

//MARK:- SETUP CONSTRAINTS

extension NewListView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo:topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            categorieImage.centerYAnchor.constraint(equalTo: backgroundCategorieImage.centerYAnchor),
            categorieImage.centerXAnchor.constraint(equalTo: backgroundCategorieImage.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundCategorieImage.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 20),
            backgroundCategorieImage.widthAnchor.constraint(equalToConstant: 100),
            backgroundCategorieImage.heightAnchor.constraint(equalToConstant: 100),
            backgroundCategorieImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
}
