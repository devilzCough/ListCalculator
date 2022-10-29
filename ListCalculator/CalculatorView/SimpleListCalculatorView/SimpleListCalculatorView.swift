//
//  SimpleListView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import SwiftUI

struct SimpleListCalculatorView: View {
    
    @Binding var selection: Tab
    @State private var items: [Item] = [Item()]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($items) { item in
                        SimpleListCalculatorItemRow(item: item)
                    }
                    
                    Button("Add") {
                        items.append(Item())
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Reset") {
                            items = [Item()]
                        }
                    }
                    ToolbarItemGroup {
                        Button("Save") {
                            print("Save")
                        }
                        
                        Button("Close") {
                            didTapCloseButton()
                        }
                    }
                }
                CalculateResultView(items: $items)
            }
        }
    }
    
    func didTapCloseButton() {
        selection = .list
    }
}

struct SimpleListView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListCalculatorView(selection: .constant(.calculator))
    }
}
