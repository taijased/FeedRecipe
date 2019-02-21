//
//  RecipeViewController.swift
//  FeedRecipe
//
//  Created by Maxim Spiridonov on 21/02/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import Kingfisher
import Bond

class RecipeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var viewModel: RecipeModel!
    @IBOutlet weak var collectionView: UICollectionView!
    private let activityIndicator = UIActivityIndicatorView()
    var refresher: UIRefreshControl = UIRefreshControl()
    var fetchingMore: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RecipeModel(dataManager: WorkshopAPI())
        setupUI()
        bindViewModel()
        viewModel.fetch()
        refresher.attributedTitle = NSAttributedString(string: "pull to refresh")
        refresher.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        collectionView.addSubview(refresher)
    }

    @objc private func refreshData(_ sender: Any) {
        // Fetch Data
        viewModel.fetch()
        self.refresher.endRefreshing()
        self.activityIndicator.stopAnimating()
    }

    func bindViewModel() {
        
        viewModel.recipes.bind(to: self) { strongSelf, _ in
            strongSelf.collectionView.reloadData()
        }
        
    }
    
    func setupUI() {
        view.addSubview(activityIndicator)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height * 2 {
            
            if !fetchingMore {
                fetchingMore = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                    self.viewModel.infinityScroll()
                    self.fetchingMore = false
                })
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recipes.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCollectionViewCell

//        add property RecipeCard
        cell.recipeTitle.text = viewModel.recipes.value[indexPath.row].title
        cell.recipeAuthor.text = viewModel.recipes.value[indexPath.row].author
        cell.recipeTime.text = String(viewModel.recipes.value[indexPath.row].timing)
        cell.recipeLike.text = String(viewModel.recipes.value[indexPath.row].likeCount)
        cell.recipeChat.text = String(viewModel.recipes.value[indexPath.row].commentCount)
        
//        add View is NewRecipe
        if viewModel.recipes.value[indexPath.row].isNew {
            cell.recipeNew.layer.cornerRadius = 13
            
        } else {
//            cell.recipeNew.layer.isHidden = true
            cell.recipeNew.backgroundColor = UIColor.red
        }
        DispatchQueue.global().async {
            let url = URL(string: self.viewModel.recipes.value[indexPath.row].imageUrl)
            DispatchQueue.main.async {
                cell.recipeImage.kf.setImage(with: url)
            }
        }
        
        return cell
    }

    
}
