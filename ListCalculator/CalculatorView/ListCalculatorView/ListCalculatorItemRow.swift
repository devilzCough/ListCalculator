//
//  ListCalculatorItemRow.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorItemRow: View {
    
    @Binding var item: Item
    
    var priceFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        return formatter
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                CheckButton(isChecked: $item.isChecked)
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(width: geometry.size.width * 0.06)

                Text("\(item.name)")
                    .multilineTextAlignment(.leading)
                    .frame(width: geometry.size.width * 0.4)

                TextField("금액", value: $item.price, formatter: priceFormatter)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .frame(width: geometry.size.width * 0.35)

                TextField("수량", value: $item.count, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width * 0.12)
            }
        }   
    }
}

struct ListCalculatorItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorItemRow(item: .constant(Item()))
    }
}
