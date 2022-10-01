//
//  ListCalculatorView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorView: View {
    
    @Environment(\.dismiss) var dismiss
//    @State private var items: [Item] = [Item()]
    @ObservedObject var list: ItemList
    
    @State private var showInputView: Bool = false
    @State private var selectedItem: Item = Item()

    func selectItem(_ item: Item) {
        self.selectedItem = item
        self.showInputView = true
    }
    
    func updateItem(_ updateItem: Item) {
        for i in 0..<list.items.count {
            if list.items[i].id == updateItem.id {
                list.items[i] = updateItem
                break
            }
        }
    }
    
    private let size = UIScreen.main.bounds.size.width * 0.8
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List {
                        ForEach($list.items) { $item in
                            ListCalculatorItemRow(item: $item)
                                .onTapGesture {
                                    selectItem(item)
                                }
                                
                        }
                        
                        Button("Add") {
                            list.items.append(Item())
                        }
                    }
    //                .popup(isPresented: $showInputView, view: {
    //                    Color.red
    //                        .frame(width: 100, height: 100)
    //                })
                    
    //                .popup(isPresented: $showInputView) {
    //                    ListCalculatorInputView(item: $selectedItem, isPresented: $showInputView)
    //                        .frame(width: size, height: size)
    //                        .background(Color.clear)
    //                        .onDisappear {
    //                            print("disappear")
    //                            updateItem(selectedItem)
    ////                            items[selected] = selectedItem
    //                        }
    //                }
                    .navigationTitle("Title")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Reset") {
                                list.items = []
                            }
                        }
                        ToolbarItemGroup {
                            Button("Cancel") {
                                dismiss()
                            }
                            
                            Button("Save") {
                                print("Save")
                            }
                        }
                    }
                    
                    CalculateResultView(items: $list.items)
                }
            }
            
            if showInputView {
                ListCalculatorInputView(item: $selectedItem, isPresented: $showInputView)
                    .frame(width: size, height: size)
            }
           
                
        } // ZStack
    } // body
} // ListCalculatorView

struct ListCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorView(list: ItemList())
    }
}
