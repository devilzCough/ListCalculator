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
        MainListItemData(fileType: .directory, fileName: "bbb"),
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
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                List {
                    ForEach(filteredItems) { item in
                        MainListItemListStyleView(item: item)
                    }
                }
                .listStyle(.plain)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Edit") {
                        print("Edit")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        print("Add")
                    }
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
