//
//  RecipeCard.swift
//  FeedRecipe
//
//  Created by Maxim Spiridonov on 21/02/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation

class RecipeCard {
    //    private var isLiked: Bool
    //    private var isNew: Bool
    //    private var commentCount: Int
    //    private var imageUrl: String
    //    private var likeCount: Int
    //    private var title: String
    //    private var author: String
    //    private var timing: Int
    //    private var guid: String
    
    var isLiked: Bool
    var isNew: Bool
    var commentCount: Int
    var imageUrl: String
    var likeCount: Int
    var title: String
    var author: String
    var timing: Int
    var guid: String
    //    var IsLiked: Bool {
    //        get {
    //            return self.IsLiked
    //        }
    //        set(newValue) {
    //            self.IsLiked = newValue
    //        }
    //    }
    
    //    init () {
    //        self.isLiked = false
    //        self.isNew = false
    //        self.commentCount = 0
    //        self.imageUrl = ""
    //        self.likeCount = 0
    //        self.title = ""
    //        self.author = ""
    //        self.timing = 0
    //        self.guid = ""
    //    }
    init(isLiked: Bool, isNew: Bool, commentCount: Int, imageUrl: String, likeCount: Int, title: String, author: String, timing: Int, guid: String) {
        self.isLiked = isLiked
        self.isNew = isNew
        self.commentCount = commentCount
        self.imageUrl = imageUrl
        self.likeCount = likeCount
        self.title = title
        self.author = author
        self.timing = timing
        self.guid = guid
    }
}
