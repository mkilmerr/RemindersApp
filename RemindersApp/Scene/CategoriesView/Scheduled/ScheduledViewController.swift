//
//  ScheduledViewController.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 31/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ScheduledViewController: UIViewController {
    let scheduledView =  ScheduledView()
    
    override func loadView() {
        view = scheduledView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

}
