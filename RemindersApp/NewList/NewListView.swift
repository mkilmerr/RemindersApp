//
//  NewListView.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 31/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class NewListView: UIView {
    lazy var contentViewSize = CGSize(width: self.frame.width, height: self.frame.height + 100)
    lazy var colors:[UIColor] = [.red,.gray,.blue,.brown, .green, .purple]
    lazy var secondColor:[UIColor] = [.systemPink,.magenta,.black,.orange,.systemTeal,.tertiarySystemFill]
    
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
        stack.spacing = 80
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
    
    
    lazy var colorStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var secondColorStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .systemBackground
        scroll.contentSize = CGSize(width: 200, height: 2000)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        
        self.colors.forEach { (color) in
            self.createColorButton(color,stack: self.colorStackView)
        }
        self.secondColor.forEach { (color) in
            self.createColorButton(color, stack: self.secondColorStackView)
        }
        
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
        //        addSubview(colorStackView)
        //        addSubview(secondColorStackView)
        addSubview(scrollView)
        
        scrollView.addSubview(colorStackView)
        scrollView.addSubview(secondColorStackView)
        
    }
}

//MARK:- SETUP CONSTRAINTS

extension NewListView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo:topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
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
        
        
        NSLayoutConstraint.activate([
            colorStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            colorStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secondColorStackView.topAnchor.constraint(equalTo: colorStackView.bottomAnchor, constant: 10),
            secondColorStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: backgroundCategorieImage.bottomAnchor, constant: 100),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}

//MARK:- COLOR BUTTONS

extension NewListView {
    func createColorButton(_ color:UIColor, stack:UIStackView){
        let button = UIButton(type: .system)
        button.backgroundColor = color
        button.layer.cornerRadius =   25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(colorButtonTapped(_:)), for: .allEvents)
        stack.addArrangedSubview(button)
        
    }
    
    @objc func colorButtonTapped(_ sender:UIButton){
        self.backgroundCategorieImage.backgroundColor = sender.backgroundColor
    }
}
