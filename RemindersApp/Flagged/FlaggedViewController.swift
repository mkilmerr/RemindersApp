//
//  FlaggedViewController.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 31/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class FlaggedViewController: UIViewController {
    let flaggedView = FlaggedView()
    
    override func loadView() {
        view = flaggedView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
