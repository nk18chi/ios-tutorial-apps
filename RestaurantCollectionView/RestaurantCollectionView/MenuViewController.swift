//
//  MenuViewController.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-22.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var collectionViewA: UICollectionView!
    private let padding: CGFloat = 16
    private let filterHeight: CGFloat = 70
    private var categoryFilters: [CategoryFilter] = CategoryFilter.getInitializeData()
    private var filters: Set<String> = []
    
    override func loadView() {
      super.loadView()
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      layout.minimumInteritemSpacing = padding
      layout.minimumLineSpacing = padding
      layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
      collectionViewA = UICollectionView(frame: .init(x: 0, y: (navigationController?.navigationBar.frame.height)!, width: view.frame.width, height: filterHeight + padding * 2), collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundGray
        navigationItem.title = "Blah blah blah Kitchen's"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor  = .mainRed
        view.addSubview(collectionViewA)
        collectionViewA.backgroundColor = .backgroundGray
        collectionViewA.register(CategoryFilterCollectionViewCell.self, forCellWithReuseIdentifier: "categoryFilter")
        collectionViewA.dataSource = self
        collectionViewA.delegate = self
    }
}

extension MenuViewController: UICollectionViewDataSource {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryFilters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryFilter", for: indexPath) as! CategoryFilterCollectionViewCell
        cell.labelView.text = categoryFilters[indexPath.row].name
        cell.labelView.textColor = categoryFilters[indexPath.row].isOn ? .white : .mainRed
        cell.backgroundColor = categoryFilters[indexPath.row].isOn ? .mainRed : .white
        return cell
    }
    
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryFilters[indexPath.row].isOn = !categoryFilters[indexPath.row].isOn
        if (categoryFilters[indexPath.row].isOn) {
            filters.insert(categoryFilters[indexPath.row].name)
        } else {
            filters.remove(categoryFilters[indexPath.row].name)
        }
        collectionViewA.reloadItems(at: [indexPath])
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: padding, left: 0, bottom: padding, right: 0)
  }
}