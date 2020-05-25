//
//  Food.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-23.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

struct Food {
    var name: String
    var cost: Int
    var category: [CategoryFilter.Category]

    static func getInitializeData() -> [Food] {
        return [
            Food(name: "sushi", cost: 10, category: [.fish]),
            Food(name: "kaisen", cost: 15, category: [.don, .fish]),
            Food(name: "unagi", cost: 15, category: [.don, .fish]),
            Food(name: "udon", cost: 8, category: [.noodle]),
            Food(name: "breakfast", cost: 5, category: [.breakfast]),
            Food(name: "obento", cost: 10, category: [.lunch]),
            Food(name: "onigiri", cost: 3, category: [.rice, .breakfast, .lunch]),
            Food(name: "takoyaki", cost: 15, category: [.osaka]),
            Food(name: "nabeyaki", cost: 10, category: [.noodle]),
            Food(name: "oyakodon", cost: 12, category: [.don, .meat]),
            Food(name: "okonomiyaki", cost: 15, category: [.osaka]),
            Food(name: "soba", cost: 9, category: [.noodle]),
            Food(name: "oden", cost: 7, category: [.other]),
            Food(name: "ramen", cost: 10, category: [.noodle, .chinese]),
            Food(name: "omurice", cost: 12, category: [.rice]),
            Food(name: "sashimi", cost: 30, category: [.fish]),
            Food(name: "curry", cost: 9, category: [.rice]),
            Food(name: "gyoza", cost: 4, category: [.chinese]),
            Food(name: "tenpura", cost: 18, category: [.rice, .fish]),
            Food(name: "yakitori", cost: 10, category: [.meat]),
            Food(name: "tendon", cost: 15, category: [.don]),
            Food(name: "tonkatsu", cost: 17, category: [.meat]),
            Food(name: "friedrice", cost: 10, category: [.rice]),
            Food(name: "hotpot", cost: 22, category: [.meat]),
            Food(name: "monja", cost: 20, category: [.other]),
            Food(name: "taiyaki", cost: 2, category: [.dessert]),
            Food(name: "anmitsu", cost: 5, category: [.dessert]),
            Food(name: "dorayaki", cost: 3, category: [.dessert])
        ]
    }
}
