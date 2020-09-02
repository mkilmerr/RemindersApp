//
//  CategoriesView.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 29/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class CategoriesView: UIView {
    
    lazy var categorieImage : UIImageView = {
       let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
       
        return image
    }()
    
    
    lazy var counterCategorie: UILabel = {
       let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.label
        
        return label
    }()
    
    lazy var categorieName: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    init(imageName:String, counter:String, name:String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
      
        self.categorieImage.image = UIImage(named: imageName)
        self.counterCategorie.text = counter
        self.categorieName.text = name
        
        backgroundColor = .systemGray
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- SETUP UI COMPONENTS

extension CategoriesView {
    
    func setupComponents() {
        addSubviewWithAutoLayout(categorieImage)
        addSubviewWithAutoLayout(counterCategorie)
        addSubviewWithAutoLayout(categorieName)
    }
}

//MARK:- SETUP CONSTRAINTS TO COMPONENTS

extension CategoriesView {
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            categorieImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            categorieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            categorieImage.widthAnchor.constraint(equalToConstant: 30),
            categorieImage.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            counterCategorie.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            counterCategorie.topAnchor.constraint(equalTo: categorieImage.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categorieName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7),
            categorieName.leadingAnchor.constraint(equalTo: categorieImage.leadingAnchor)
        ])
    }
}
