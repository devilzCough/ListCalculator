//
//  TabItem.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct TabItemView: View {
    
    let item: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: item.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isSelected ? .blue : .gray)
                .frame(width: 32, height: 32)
                
            Spacer()
                .frame(height: 4)
            
            if !item.title.isEmpty {
                Text(item.title)
                    .foregroundColor(isSelected ? .blue : .gray)
                    .font(.caption)
            }
        }
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView(item: TabItemData(icon: "gearshape.fill", title: ""), isSelected: true)
    }
}
