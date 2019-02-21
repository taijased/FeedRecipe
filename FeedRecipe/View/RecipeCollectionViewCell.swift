//
//  RecipeCollectionViewCell.swift
//  FeedRecipe
//
//  Created by Maxim Spiridonov on 21/02/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeNew: UIView!
    @IBOutlet weak var recipeChat: UILabel!
    @IBOutlet weak var recipeLike: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeAuthor: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView! {
        didSet {
            recipeImage.layer.cornerRadius = 10
            recipeImage.clipsToBounds = true
        }
    }

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
////        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
////        frame.addGestureRecognizer(tap)
////        self.frame.isUserInteractionEnabled = true
////
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //This creates the shadows and modifies the cards a little bit
        setupUI()
        setupRecognizer()
    }
    func setupUI () {
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    func setupRecognizer() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print(self.recipeTitle.text!)
        
    }
}
