//
//  ListCalculatorView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var items: [Item] = [Item()]
    
    private let size = UIScreen.main.bounds.size.width * 0.8
    
    @State private var selection: Int?
    @State private var selectedItem: Item = Item()
    
    @State private var isSavedNewValue = true
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    ZStack {
                        List($items.indices, id: \.self, selection: $selection) { index in
                            ListCalculatorItemRow(item: $items[index])
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
                                    dismiss()
                                }

                                Button("Save") {
                                    print("Save")
                                }
                            }
                        }
                        .refreshable {
                            addItem()
                        }
                        
                        addButton
                    }
                    
                    CalculateResultView(items: $items)      
                }
            } // NavigationView
            
            if let selection = selection {
                
                VisualEffect(effect: UIBlurEffect(style: .dark))
                    .edgesIgnoringSafeArea(.all)
                
                ListCalculatorInputView(item: $selectedItem, hasSelection: $selection, didTapDoneButton: $isSavedNewValue)
                    .frame(width: size, height: size)
                    .onAppear {
                        selectedItem = items[selection]
                    }
                    .onDisappear {
                        if isSavedNewValue {
                            items[selection] = selectedItem
                        }
                        selectedItem = Item()
                    }
            }
        } // ZStack
    } // body
    
    @ViewBuilder
    var addButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    addItem()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .padding()
                }
                .background(Color.yellow)
                .cornerRadius(25)
                .padding()
            }
        }
    }
    
    private func addItem() {
        items.append(Item())
        selection = items.count - 1
    }
} // ListCalculatorView

struct ListCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorView()
    }
}
