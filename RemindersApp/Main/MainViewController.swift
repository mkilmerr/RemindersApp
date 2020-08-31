//
//  MainViewController.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 29/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var models = [
        "first",
        "second",
        "third",
        "fourth"
    ]
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        addCategoriesViewTarget()
        setupSearchBar()
        setupNavigationButton()
        
    }
    
}


//MARK:- REGISTER TABLE VIEW CELL

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    func registerCell() {
        mainView.myListsView.tableView.delegate = self
        mainView.myListsView.tableView.dataSource = self
        mainView.myListsView.tableView.register(MyListsTableViewCell.self, forCellReuseIdentifier: MyListsTableViewCell.cellIdentifier)
        
    }
}

//MARK:- TABLE VIEW METHODS

extension MainViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyListsTableViewCell.cellIdentifier , for: indexPath) as! MyListsTableViewCell
        cell.categorieName.text = self.models[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        footerView.backgroundColor = .systemBackground
        let addList = UIButton(type: .system)
        addList.setTitle("Add List", for: .normal)
        footerView.addSubview(addList)
        addList.translatesAutoresizingMaskIntoConstraints = false
        addList.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -14).isActive = true
        addList.addTarget(self, action: #selector(addListTapped), for: .allTouchEvents)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: mainView.firstStackView.leadingAnchor).isActive = true
        titleLabel.text = "My Lists"
        return titleLabel
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.models.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.models.remove(at: indexPath.row)
            tableView.reloadData()
        })

        return [deleteAction]
    }
}



//MARK:- NAVIGATION ITEM

extension MainViewController {
    
    @objc func setupNavigationButton() {
        self.mainView.myListsView.tableView.isEditing = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    @objc func editTapped() {
        if self.mainView.myListsView.tableView.isEditing {
            self.mainView.myListsView.tableView.isEditing = false
        }else {
            self.mainView.myListsView.tableView.isEditing = true
        }
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
        let todayViewController = TodayViewController()
        self.mainView.todayView.scaleAnimation(self.mainView.todayView)
        self.mainView.todayView.backgroundColor = .blue
        self.navigationController?.pushViewController(todayViewController, animated: true)
    }
    
    @objc func scheduledViewTapped() {
        let scheduledViewController = ScheduledViewController()
        self.mainView.scheduledView.scaleAnimation(self.mainView.scheduledView)
        self.mainView.scheduledView.backgroundColor = .blue
        self.navigationController?.pushViewController(scheduledViewController, animated: true)
    }
    
    @objc func allViewTapped() {
        let allViewController = AllViewController()
        self.mainView.scheduledView.scaleAnimation(self.mainView.allView)
        self.mainView.allView.backgroundColor = .blue
        self.navigationController?.pushViewController(allViewController, animated: true)
    }
    
    @objc func flaggedViewTapped() {
        let flaggedViewController = FlaggedViewController()
        self.mainView.flaggedView.scaleAnimation(self.mainView.flaggedView)
        self.mainView.flaggedView.backgroundColor = .blue
        self.navigationController?.pushViewController(flaggedViewController, animated: true)
    }
    
}

//MARK:- BUTTON TARGETS

extension MainViewController {
    @objc func addListTapped() {
        print("TAP")
    }
}
