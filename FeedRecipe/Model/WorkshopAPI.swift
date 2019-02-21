//
//  WorkshopAPI.swift
//  FeedRecipe
//
//  Created by Maxim Spiridonov on 21/02/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit



class WorkshopAPI {
    
    
    private var infinity: Bool = true
    public func fetchRecipes(page: Int, count: Int, completion: @escaping (_ items: [RecipeCard])->()) {
        
        if self.infinity  {
            let base_url: String = "https://api.static.tim.agency/tm_leroy_merlin/recipe?page=" + String(page) + "&count=" + String(count)
            var result:[RecipeCard] = []
            
            Alamofire.request(base_url).responseJSON { response in
                guard response.result.isSuccess else {
                    print("Ошибка при запросе данных \(String(describing: response.result.error))")
                    return
                }
                for (index, item) in JSON(response.value)["recipes"] {
                    var recipe = RecipeCard(isLiked: item["isLiked"].boolValue, isNew: item["isNew"].boolValue, commentCount: item["commentCount"].intValue, imageUrl: item["imageUrl"].stringValue, likeCount: item["likeCount"].intValue, title: item["title"].stringValue, author: item["author"].stringValue, timing: item["timing"].intValue, guid: item["guid"].stringValue)
                    result.append(recipe)
                }
                self.infinity = !result.isEmpty
                completion(result)
            }
        } else {
            completion([])
        }
        
    }
}
