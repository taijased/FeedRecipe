//
//  RecipeModel.swift
//  FeedRecipe
//
//  Created by Maxim Spiridonov on 21/02/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation
import Bond

class RecipeModel {
    var recipes = Observable<[RecipeCard]>([])
    private let dataManager: WorkshopAPI
    private var page: Int = 1
    private var count: Int = 3
    var infinity: Bool = true
    
    
    init(dataManager: WorkshopAPI) {
        self.dataManager = dataManager
        
    }
    func fetch () {
        dataManager.fetchRecipes(page: 1, count: self.count) { [weak self] items in
            self?.recipes.value += !items.isEmpty ? items : []
            self?.page += 1
            print(items)
        }
    }
    func infinityScroll () {
        dataManager.fetchRecipes(page: self.page, count: self.count) { [weak self] items in
            self?.recipes.value += !items.isEmpty ? items : []
            self?.page += 1
        }
    }
}
