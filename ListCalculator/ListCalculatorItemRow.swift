//
//  ListCalculatorItemRow.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorItemRow: View {
    
    @Binding var item: Item
    
    var body: some View {
        HStack {
            CheckButton(isChecked: $item.isChecked)
                .frame(width: 20)
            
            TextField("이름", text: $item.name)
                .disabled(true)
            
            TextField("금액", text: $item.price)
                .disabled(true)

            Stepper(value: $item.count, in: 1...100) {
                Text("\(item.count)")
            }
        }
    }
}

struct ListCalculatorItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorItemRow(item: .constant(Item(id: 1)))
    }
}
