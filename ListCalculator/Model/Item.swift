//
//  Item.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import Foundation

struct Item: Identifiable {
    let id = UUID().uuidString
    var name = ""
    var isChecked: Bool = true
    var price = 0
    var count = 1
}
