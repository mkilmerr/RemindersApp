//
//  CategorieViewModel.swift
//  RemindersApp
//
//  Created by Marcos Kilmer on 02/09/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

class CategorieViewModel {
    var categorieArray = [Categorie]()
    
    func addCategorie(_ categorie:Categorie) {
        self.categorieArray.append(categorie)
    }
}
