//
//  TabView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct MountStyleTabBarView: View {
    
    let tabItems: [TabItemData]
    @Binding var selectedTab: Tab
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var center: Int {
        tabItems.count / 2
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(tabItems.indices, id: \.self) { index in
                let item = tabItems[index]
                Button {
                    selectedTab = Tab.allCases[index]
                } label: {
                    let isSelected = selectedTab == Tab.allCases[index]
                    if index == center {
                        ZStack {
                            CenterTabView(size: width * 0.18)
                            TabItemView(item: item, isSelected: isSelected)
                        }
                        .offset(y: -height/8/4)
                    } else {
                        TabItemView(item: item, isSelected: isSelected)
                    }
                }
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.yellow)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MountStyleTabBarView(
            tabItems: [
                TabItemData(icon: "list.bullet.rectangle.portrait.fill", title: "list"),
                TabItemData(icon: "plus", title: ""),
                TabItemData(icon: "gearshape.fill", title: "setting")
                      ],
            selectedTab: .constant(.list)
        )
    }
}
