//
//  ContentView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import SwiftUI

enum Tab: Int, CaseIterable {
    case list
    case calculator
    case setting
    
    var tabItem: TabItemData {
        switch self {
        case .list:
            return TabItemData(icon: "list.bullet.rectangle.portrait.fill", title: "계산 리스트")
        case .calculator:
            return TabItemData(icon: "plus", title: "")
        case .setting:
            return TabItemData(icon: "gearshape.fill", title: "설정")
        }
    }
}

struct ContentView: View {
    
    @State private var selection: Tab = .list
    
    var body: some View {
        
        CustomTabView(tabs: Tab.allCases.map { $0.tabItem }, selectedTab: $selection) { tab in
            getTabView(type: tab)
        }
        .animation(.easeInOut, value: selection)
    }
    
    @ViewBuilder
    func getTabView(type: Tab) -> some View {
        switch type {
        case .list:
            MainListView()
        case .calculator:
            SimpleListCalculatorView(selection: $selection)
        case .setting:
            SettingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
