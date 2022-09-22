//
//  CustomTabView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var center: Int {
        return tabs.count / 2
    }
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
//                if selectedIndex != center {
                    MountStyleTabView(tabItems: tabs, selectedIndex: $selectedIndex)
//                }
                
            }
            .frame(maxHeight: .infinity)
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
            selectedIndex: .constant(0)) { index in
                if index == 0 {
                    MainListView()
                }
            }
    }
}
