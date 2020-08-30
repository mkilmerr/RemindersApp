//
//  MainViewController.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 29/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCategoriesViewTarget()
        setupSearchBar()
        setupNavigationButton()
        
        
    }
    

}

//MARK:- NAVIGATION ITEM

extension MainViewController {
    
    @objc func setupNavigationButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    @objc func editTapped() {
       self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(setupNavigationButton))
    }
}

//MARK:- SEARCH BAR

extension MainViewController: UISearchResultsUpdating {
    
    func setupSearchBar() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search"
        navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        print(searchText)
    }
    
    
}

//MARK:- CATEGORIES VIEW GESTURE

extension MainViewController {
    
    func addCategoriesViewTarget(){
        
        self.mainView.isUserInteractionEnabled = true
        
        let todayGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(todayViewTapped))
        self.mainView.todayView.addGestureRecognizer(todayGesture)
        
        let scheduledGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scheduledViewTapped))
        self.mainView.scheduledView.addGestureRecognizer(scheduledGesture)
        
        let allGesture:UITapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(allViewTapped))
        self.mainView.allView.addGestureRecognizer(allGesture)
        
        let flaggedGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(flaggedViewTapped))
        self.mainView.flaggedView.addGestureRecognizer(flaggedGesture)
    }
}
//MARK:- VIEW TARGETS

extension MainViewController {
    
    @objc func todayViewTapped() {
        self.mainView.todayView.scaleAnimation(self.mainView.todayView)
        self.mainView.todayView.backgroundColor = .blue
    }
    
    @objc func scheduledViewTapped() {
        self.mainView.scheduledView.scaleAnimation(self.mainView.scheduledView)
        self.mainView.scheduledView.backgroundColor = .blue
    }
    
    @objc func allViewTapped() {
        self.mainView.scheduledView.scaleAnimation(self.mainView.allView)
        self.mainView.allView.backgroundColor = .blue
    }
    
    @objc func flaggedViewTapped() {
        self.mainView.flaggedView.scaleAnimation(self.mainView.flaggedView)
        self.mainView.flaggedView.backgroundColor = .blue
    }
}
