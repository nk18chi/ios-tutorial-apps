//
//  CategoryFilter.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-23.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

struct CategoryFilter {
    var name: String
    var isOn: Bool = false

    static func getInitializeData() -> [CategoryFilter] {
        return [
            CategoryFilter(name: "aaa", isOn: true),
            CategoryFilter(name: "bbbbbbb"),
            CategoryFilter(name: "cccccc"),
            CategoryFilter(name: "ddddd"),
            CategoryFilter(name: "eeeeeee"),
            CategoryFilter(name: "fffff")
        ]
    }
}
