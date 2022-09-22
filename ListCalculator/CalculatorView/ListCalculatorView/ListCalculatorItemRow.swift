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
        return formatter
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                CheckButton(isChecked: $item.isChecked)
                    .frame(width: 20)
                
                TextField("이름", text: $item.name)
                    .frame(width: geometry.size.width * 0.35)
                
                TextField("금액", value: $item.price, formatter: priceFormatter)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 5)
                
                InputStepper(count: $item.count)
            }
        }   
    }
}

struct ListCalculatorItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorItemRow(item: .constant(Item()))
    }
}
