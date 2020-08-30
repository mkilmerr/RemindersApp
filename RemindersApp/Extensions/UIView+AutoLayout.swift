//
//  UIView+AutoLayout.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 29/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviewWithAutoLayout(_ view:UIView ) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false 
    }
}
