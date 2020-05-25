//
//  CategoryFilter.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-23.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

struct CategoryFilter {
    var name: Category
    var isOn: Bool = false
    
    enum Category {
        case fish
        case don
        case noodle
        case breakfast
        case lunch
        case rice
        case osaka
        case chinese
        case meat
        case dessert
        case other
    }
    
    static func getInitializeData() -> [CategoryFilter] {
        return [
            CategoryFilter(name: .fish),
            CategoryFilter(name: .don),
            CategoryFilter(name: .noodle),
            CategoryFilter(name: .breakfast),
            CategoryFilter(name: .lunch),
            CategoryFilter(name: .rice),
            CategoryFilter(name: .osaka),
            CategoryFilter(name: .chinese),
            CategoryFilter(name: .meat),
            CategoryFilter(name: .dessert),
            CategoryFilter(name: .other),
        ]
    }
}

extension CategoryFilter.Category: RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: String) {
      switch rawValue {
        case "fish": self = .fish
        default:
          return nil
      }
    }
  
    var rawValue: String {
        switch self {
        case .fish: return "fish"
        case .don: return "don"
        case .noodle: return "noodle"
        case .breakfast: return "breakfast"
        case .lunch: return "lunch"
        case .rice: return "rice"
        case .osaka: return "osaka"
        case .chinese: return "chinese"
        case .meat: return "meat"
        case .dessert: return "desserts"
        case .other: return "other"
        }
    }
}
