//
//  MainListView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct MainListView: View {
    
    private var listItems = [
        MainListItemData(fileType: .list, fileName: "aaa"),
        MainListItemData(fileType: .directory, fileName: "bbb",
                         content: [MainListItemData(fileType: .list, fileName: "test1"), MainListItemData(fileType: .list, fileName: "test2"),
                                   MainListItemData(fileType: .directory, fileName: "test3")]),
        MainListItemData(fileType: .list, fileName: "ccc"),
        MainListItemData(fileType: .list, fileName: "ddd"),
        MainListItemData(fileType: .directory, fileName: "bbakdk"),
        MainListItemData(fileType: .list, fileName: "eee"),
        MainListItemData(fileType: .list, fileName: "bbekek"),
        MainListItemData(fileType: .directory, fileName: "fff")
    ]
    
    private var filteredItems: [MainListItemData] {
        listItems.filter { $0.fileName.hasPrefix(searchText) }
    }
    
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(.horizontal)
            List(filteredItems, children: \.content) { item in
                if item.fileType == .list {
                    NavigationLink {
                        ListCalculatorView()
                            .navigationBarHidden(true)
                    } label: {
                        MainListItemListStyleView(item: item)
                    }
                } else {
                    MainListItemListStyleView(item: item)
                }
            }
            .listStyle(.plain)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ListCalculatorView()
                        .navigationBarHidden(true)
                } label: {
                    Text("Add")
                }

            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
