//
//  MenuViewController.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-22.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var categoryFilterCV: UICollectionView!
    var foodCV: UICollectionView!
    private let padding: CGFloat = 16
    private let filterHeight: CGFloat = 70
    private var categoryFilterData: [CategoryFilter] = CategoryFilter.getInitializeData()
    private var foodData: [Food] = Food.getInitializeData()
    private var curFilters: Set<String> = []
    
    override func loadView() {
        super.loadView()
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
        filterLayout.minimumInteritemSpacing = padding
        filterLayout.minimumLineSpacing = padding
        filterLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        categoryFilterCV = UICollectionView(frame: .init(x: 0, y: (navigationController?.navigationBar.frame.height)!, width: view.frame.width, height: filterHeight + padding * 2), collectionViewLayout: filterLayout)
        
        let foodLayout = UICollectionViewFlowLayout()
        foodLayout.scrollDirection = .vertical
        foodLayout.minimumInteritemSpacing = padding
        foodLayout.minimumLineSpacing = padding
        foodCV = UICollectionView(frame: .init(x: 0, y: (navigationController?.navigationBar.frame.height)! + filterHeight + padding * 2, width: view.frame.width, height: view.frame.height - (navigationController?.navigationBar.frame.height)! - filterHeight - padding * 2), collectionViewLayout: foodLayout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundGray
        navigationItem.title = "Japanese Kitchen's"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor  = .mainRed
        
        categoryFilterCV.backgroundColor = .backgroundGray
        categoryFilterCV.register(CategoryFilterCollectionViewCell.self, forCellWithReuseIdentifier: "categoryFilter")
        categoryFilterCV.dataSource = self
        categoryFilterCV.delegate = self
        view.addSubview(categoryFilterCV)
        
        foodCV.backgroundColor = .backgroundGray
        foodCV.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: "food")
        foodCV.dataSource = self
        foodCV.delegate = self
        view.addSubview(foodCV)
    }
}

extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == self.categoryFilterCV ? categoryFilterData.count : foodData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.categoryFilterCV) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryFilter", for: indexPath) as! CategoryFilterCollectionViewCell
            cell.labelView.text = categoryFilterData[indexPath.row].name.rawValue
            cell.labelView.textColor = categoryFilterData[indexPath.row].isOn ? .white : .mainRed
            cell.backgroundColor = categoryFilterData[indexPath.row].isOn ? .mainRed : .white
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "food", for: indexPath) as! FoodCollectionViewCell
            cell.imageView.image = UIImage(named: foodData[indexPath.row].name)
            cell.nameView.text = foodData[indexPath.row].name
            cell.priceView.text = "$\(foodData[indexPath.row].cost)"
            cell.categoryView.text = foodData[indexPath.row].category.map({$0.rawValue}).joined(separator: ", ")
            return cell
        }
    }
    
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == self.categoryFilterCV) {
            categoryFilterData[indexPath.row].isOn = !categoryFilterData[indexPath.row].isOn
            if (categoryFilterData[indexPath.row].isOn) {
                curFilters.insert(categoryFilterData[indexPath.row].name.rawValue)
            } else {
                curFilters.remove(categoryFilterData[indexPath.row].name.rawValue)
            }
            categoryFilterCV.reloadItems(at: [indexPath])
        }
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if (collectionView == self.foodCV) {
        let size = (collectionView.frame.width - 3 * padding) / 2.0
        return CGSize(width: size, height: size)
    } else {
        return CGSize(width: 1, height: 1) // I do not understand why this is necesarry(inseting zero does not work)... I guess because automaticSize is unstable.
    }
  }
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: padding, left: padding, bottom: padding, right: padding)
  }
}
