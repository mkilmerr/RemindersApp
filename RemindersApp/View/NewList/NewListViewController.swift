//
//  NewListViewController.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 31/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
protocol CategorieProtocol {
    func addCategorieProtocol(name:String, image:UIImage)
}
class NewListViewController: UIViewController {
    var categorieProtocol: CategorieProtocol?
    
    let newListView = NewListView()
    
    lazy var categorieTextField: UITextField = {
        let text = UITextField()
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.clearButtonMode = .whileEditing
        text.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        text.layer.cornerRadius = 10
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = newListView
        
        newListView.cancelButton.addTarget(self, action: #selector(cancelTapped), for: .allTouchEvents)
        newListView.doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        self.categorieTextField.delegate = self

        setupTextFieldConstraints()
    }
    
    
}

//MARK:- BUTTON TARGETS

extension NewListViewController {
    @objc func cancelTapped() {
        self.dismiss(animated: true)
    }
    
    @objc func doneTapped() {
        self.categorieProtocol?.addCategorieProtocol(name: categorieTextField.text!, image: self.newListView.categorieImage.image!)
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

//MARK:- TEXTFIELD DELEGATE METHODS

extension NewListViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DidBeginEditing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}

