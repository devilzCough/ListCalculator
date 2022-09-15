//
//  ListCalculatorInputView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorInputView: View {
    
    @Binding var item: Item
    
    var body: some View {
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
                }
                .frame(maxWidth: .infinity)
                Divider()
                Button("Done") {
                    print("Done")
                }
                .frame(maxWidth: .infinity)
            }
            .listRowInsets(EdgeInsets())
            .background(Color.yellow)
        }
        .listStyle(.inset)
    }
}

struct ListCalculatorInputView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorInputView(item: .constant(Item()))
            .previewLayout(.fixed(width: 220, height: 220))
    }
}
