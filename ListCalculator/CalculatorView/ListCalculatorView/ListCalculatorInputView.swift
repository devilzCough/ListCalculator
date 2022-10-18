//
//  ListCalculatorInputView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorInputView: View {
    
    @Binding var item: Item
    @State private var copiedItem: Item
    
    @Binding var hasSelection: Int?
    
    init(item: Binding<Item>, hasSelection: Binding<Int?>) {
        self._item = item
        self._hasSelection = hasSelection
        self._copiedItem = State(initialValue: item.wrappedValue)
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            List {
                TextField("이름", text: $item.name)
                TextField("금액", value: $item.price, formatter: NumberFormatter())
                Stepper(value: $item.count, in: 1...100) {
                    Text("\(item.count)")
                }
                
                HStack {
                    Text("금액 포함 여부")
                    CheckButton(isChecked: $item.isChecked)
                        .frame(width: 20, height: 20)
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    Button("Cancel") {
                        print("Cancel")
                        item = copiedItem
                        hasSelection = nil
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Divider()
                    
                    Button("Done") {
                        print("Done")
                        hasSelection = nil
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(BorderlessButtonStyle())
                }
                .listRowInsets(EdgeInsets())
                .background(Color.yellow)
            }
            .scrollContentBackground(.hidden)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ListCalculatorInputView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorInputView(item: .constant(Item()), hasSelection: .constant(0))
            .previewLayout(.fixed(width: 220, height: 320))
    }
}
