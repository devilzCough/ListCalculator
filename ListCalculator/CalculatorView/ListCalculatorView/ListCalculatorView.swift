//
//  ListCalculatorView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorView: View {
    
    @Environment(\.dismiss) var dismiss
//    @Environment(\.editMode) var editMode
    @State private var items: [Item] = [Item()]
    
    private let size = UIScreen.main.bounds.size.width * 0.8
    
    @State private var selection: Int?
    @State private var selectedItem: Item = Item()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List($items.indices, id: \.self, selection: $selection) { index in
                        
                        ListCalculatorItemRow(item: $items[index])
                    }
                    .navigationTitle("Title")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Reset") {
                                items = []
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
                    
                    Button("Add") {
                        items.append(Item())
                    }
                    
                    CalculateResultView(items: $items)
                }
            } // NavigationView
            
            if let selection = selection {
                ListCalculatorInputView(item: $selectedItem, hasSelection: self.$selection)
                    .frame(width: size, height: size)
                    .onAppear {
                        selectedItem = items[selection]
                    }
                    .onDisappear {
                        items[selection] = selectedItem
                    }
            }
        } // ZStack
    } // body
} // ListCalculatorView

struct ListCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorView()
    }
}
