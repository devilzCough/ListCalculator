//
//  SimpleListView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import SwiftUI

struct SimpleListCalculatorView: View {
    
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
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Close") {
                            print("Close")
                        }
                    }
                }
                CalculateResultView(items: $items)
            }
        }
    }
}

struct SimpleListView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListCalculatorView()
    }
}
