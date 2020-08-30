//
//  UIView+Animation.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 30/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

extension UIView {
    
    func scaleAnimation(_ view:UIView) {
        UIView.animate(withDuration: 0.4,
                       animations: {
                        view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.4) {
                            view.transform = CGAffineTransform.identity
                            view.backgroundColor = .systemGray
                        }
        })
    }
}
