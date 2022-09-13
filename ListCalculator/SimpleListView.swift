//
//  SimpleListView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import SwiftUI

struct SimpleListView: View {
    
    @State private var index = 1
    @State private var items: [Item] = [Item(id: 1)]
    
    var checkedItems: [Item] {
        items.filter { item in
            item.isChecked
        }
    }
    
    var totalPrice: Int {
        checkedItems.reduce(0) { partialResult, item in
            let price = Int(item.price) ?? 0
            return partialResult + price * item.count
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($items) { item in
                        SimpleListItemRow(item: item)
                    }
                    
                    Button("Add") {
                        index += 1
                        items.append(Item(id: index))
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Reset") {
                            index = 1
                            items = [Item(id: index)]
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Close") {
                            print("Close")
                        }
                    }
                }
                
                HStack {
                    Text("항목 \(checkedItems.count)개")
                        .frame(maxWidth: .infinity)
                    Text("총 \(totalPrice)원")
                        .frame(maxWidth: .infinity)
                }
                .font(.title3)
                .frame(maxHeight: 50)
                .background(Color.yellow)
            }
        }
    }
}

struct SimpleListView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListView()
    }
}
