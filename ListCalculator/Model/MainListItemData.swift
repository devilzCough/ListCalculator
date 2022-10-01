//
//  MainListItemData.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/27.
//

import Foundation

struct MainListItemData: Identifiable {
    
    enum FileType {
        case list
        case directory
        
        var icon: String {
            switch self {
            case .list:
                return "list.bullet.rectangle.portrait"
            case .directory:
                return "folder.fill"
            }
        }
    }
    
    let id = UUID()
    let fileType: FileType
    var fileName: String
    var content: [MainListItemData]?
}
