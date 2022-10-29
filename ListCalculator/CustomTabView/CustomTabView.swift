//
//  CustomTabView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedTab: Tab
    
    @ViewBuilder let content: (Tab) -> Content
    
    var center: Int {
        return tabs.count / 2
    }
    
    var body: some View {
        
        switch selectedTab {
        case .list:
            NavigationView {
                VStack {
                    content(selectedTab)
                    MountStyleTabBarView(tabItems: tabs, selectedTab: $selectedTab)
                }
            }
        case .calculator:
            content(selectedTab)
        case .setting:
            VStack {
                content(selectedTab)
                MountStyleTabBarView(tabItems: tabs, selectedTab: $selectedTab)
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(
            tabs:
                [
                    TabItemData(icon: "list.bullet.rectangle.portrait.fill", title: "list"),
                    TabItemData(icon: "plus", title: ""),
                    TabItemData(icon: "gearshape.fill", title: "setting")
                ],
            selectedTab: .constant(.list)) { tab in
                if tab == .list {
                    MainListView()
                }
            }
    }
}
