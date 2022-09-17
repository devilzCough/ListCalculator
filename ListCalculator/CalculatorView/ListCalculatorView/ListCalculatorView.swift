//
//  ListCalculatorView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorView: View {
    
    @State private var items: [Item] = [Item()]
    
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
                
                CalculateResultView(items: $items)
            }
        }
    }
}

struct ListCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorView()
    }
}
