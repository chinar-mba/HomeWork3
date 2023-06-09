//
//  MenuModel.swift
//  HomeWork3
//
//  Created by Бексултан Мусаев on 24/5/23.
//

import SwiftUI

struct MenuModel: Hashable {
    var image: Image
    var title: String
    var descriptionMenu: String
    var purchaseOption: String
    var rating: String
    var timing: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(descriptionMenu)
        hasher.combine(purchaseOption)
        hasher.combine(rating)
        hasher.combine(timing)
    }
    
    static func == (lhs: MenuModel, rhs: MenuModel) -> Bool {
        return lhs.title == rhs.title &&
            lhs.descriptionMenu == rhs.descriptionMenu &&
            lhs.purchaseOption == rhs.purchaseOption &&
            lhs.rating == rhs.rating
    }
}
