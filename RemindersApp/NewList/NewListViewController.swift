//
//  NewListViewController.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 31/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class NewListViewController: UIViewController {
    let newListView = NewListView()
    
    lazy var categorieTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        text.layer.cornerRadius = 10
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = newListView
        
        newListView.cancelButton.addTarget(self, action: #selector(cancelTapped), for: .allTouchEvents)
        
        setupTextFieldConstraints()
    }
    
    
}

//MARK:- BUTTON TARGETS

extension NewListViewController {
    @objc func cancelTapped(){
        self.dismiss(animated: true)
    }
}

//MARK:- TEXTFIELD CONSTRAINTS

extension NewListViewController {
    func setupTextFieldConstraints() {
        self.view.addSubviewWithAutoLayout(categorieTextField)
        NSLayoutConstraint.activate([
            
            categorieTextField.topAnchor.constraint(equalTo: self.newListView.backgroundCategorieImage.bottomAnchor, constant: 20),
            categorieTextField.widthAnchor.constraint(equalToConstant: 300),
            categorieTextField.heightAnchor.constraint(equalToConstant: 50),
            categorieTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }
}

