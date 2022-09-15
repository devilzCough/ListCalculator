//
//  ListCalculatorItemRow.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorItemRow: View {
    
    @Binding var item: Item
    
    @State private var showInputView: Bool = false
    
    var body: some View {
        HStack {
            CheckButton(isChecked: $item.isChecked)
                .frame(width: 20)
            
            TextField("이름", text: $item.name)
            TextField("금액", value: $item.price, formatter: NumberFormatter())
            TextField("수량", value: $item.count, formatter: NumberFormatter())
        }
        .onTapGesture {
            showInputView = true
        }
        .sheet(isPresented: $showInputView) {
            ListCalculatorInputView(item: $item)
        }
    }
}

struct ListCalculatorItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorItemRow(item: .constant(Item()))
    }
}
