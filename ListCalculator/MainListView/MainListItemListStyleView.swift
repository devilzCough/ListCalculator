//
//  MainListItemListStyleView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/28.
//

import SwiftUI

struct MainListItemListStyleView: View {
    
    var item: MainListItemData
    
    var body: some View {
        HStack {
            Image(systemName: item.fileType.icon)
            Text(item.fileName)
            Spacer()
        }
    }
}

struct MainListItemListStyleView_Previews: PreviewProvider {
    static var previews: some View {
        MainListItemListStyleView(item: MainListItemData(fileType: .list, fileName: "test file"))
    }
}
