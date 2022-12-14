//
//  Item.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import Foundation

struct Item: Identifiable, Hashable {
    let id = UUID()
    var name = ""
    var isChecked: Bool = true
    var price = 0
    var count = 1
}

class ItemList: ObservableObject {
    @Published var items: [Item] = [Item()]
}
