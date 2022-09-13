//
//  SimpleListItemRow.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import SwiftUI

struct SimpleListItemRow: View {
    
    @Binding var item: Item
    
    var body: some View {
        HStack {
            CheckButton(isChecked: $item.isChecked)
                .frame(width: 20)
            
            TextField("금액", text: $item.price)

            Stepper(value: $item.count, in: 1...100) {
                Text("\(item.count)")
            }
        }
    }
}

struct SimpleListItemRow_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListItemRow(item: .constant(Item(id: 1)))
    }
}
