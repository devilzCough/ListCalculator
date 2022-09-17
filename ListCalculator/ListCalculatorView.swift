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
    
    @State private var showInputView: Bool = false
    @State private var selectedItem: Item = Item()
    func selectItem(_ item: Item) {
        self.selectedItem = item
        self.showInputView = true
    }
    
    private let size = UIScreen.main.bounds.size.width * 0.8
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($items) { item in
                        ListCalculatorItemRow(item: item)
                            .onTapGesture {
                                selectItem(item.wrappedValue)
                            }
                    }
                    
                    Button("Add") {
                        items.append(Item())
                    }
                }.popup(isPresented: $showInputView, view: {
                    ListCalculatorInputView(item: $selectedItem)
                        .frame(width: size, height: size)
                        .background(Color.clear)
                })
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
