//
//  Item.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import Foundation

struct Item: Identifiable {
    let id: Int
    var isChecked: Bool = true
    var price = ""
    var count = 1
}