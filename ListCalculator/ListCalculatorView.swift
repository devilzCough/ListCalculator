//
//  ListCalculatorView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorView: View {
    
    @State private var items: [Item] = [Item()]
    
    var checkedItems: [Item] {
        items.filter { item in
            item.isChecked
        }
    }
    
    var totalPrice: Int {
        checkedItems.reduce(0) { partialResult, item in
            return partialResult + item.price * item.count
        }
    }
    
    // test
//    @State var showPopup: Bool = false
//    @State private var showItemInputView: Bool = false
//    @State private var selectedItem: Item = nil
//    func selectItem(_ item: Item) {
//        self.selectedItem = item
//        self.showItemInputView = true
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($items) { item in
                        ListCalculatorItemRow(item: item)
            
//                        NavigationLink {
//                            ListCalculatorInputView(item: item)
//                        } label: {
//                            ListCalculatorItemRow(item: item)
//                        }
                    }
                    
                    Button("Add") {
                        items.append(Item())
                    }
                }
                .navigationTitle("Title")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Reset") {
                            items = [Item()]
                        }
                    }
                    ToolbarItemGroup {
                        Button("Cancel") {
                            print("Cancel")
                        }
                        
                        Button("Save") {
                            print("Save")
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

struct ListCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorView()
    }
}
