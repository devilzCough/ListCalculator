//
//  SimpleListItemRow.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import SwiftUI

struct SimpleListCalculatorItemRow: View {
    
    @Binding var item: Item
    
    var body: some View {
        HStack {
            CheckButton(isChecked: $item.isChecked)
                .frame(width: 20)
            
            TextField("금액", value: $item.price, formatter: priceFormatter)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)

            InputStepper(count: $item.count) 
        }
    }
}

struct SimpleListItemRow_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListCalculatorItemRow(item: .constant(Item()))
    }
}
