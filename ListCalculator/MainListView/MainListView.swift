//
//  MainListView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct MainListView: View {
    
    @State private var listItems = [
        MainListItemData(fileType: .list, fileName: "aaa"),
        MainListItemData(fileType: .directory, fileName: "bbb"),
        MainListItemData(fileType: .list, fileName: "ccc"),
        MainListItemData(fileType: .list, fileName: "ddd"),
        MainListItemData(fileType: .list, fileName: "eee"),
        MainListItemData(fileType: .directory, fileName: "fff")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List($listItems) { item in
                    MainListItemListStyleView(item: item)
                }
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
