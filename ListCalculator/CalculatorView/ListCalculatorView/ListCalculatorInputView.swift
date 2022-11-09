//
//  ListCalculatorInputView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct ListCalculatorInputView: View {
    
    @Binding var item: Item
    
    @Binding var hasSelection: Int?
    @Binding var didTapDoneButton: Bool
    
    var body: some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            // Fallback on earlier versions
            content
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
        }
    }
    
    @ViewBuilder
    var content: some View {
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
                    didTapDoneButton = false
                    hasSelection = nil
                    print("Cancel")
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(BorderlessButtonStyle())
                
                Divider()
                
                Button("Done") {
                    didTapDoneButton = true
                    hasSelection = nil
                    print("Done")
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(BorderlessButtonStyle())
            }
            .listRowInsets(EdgeInsets())
            .background(Color.yellow)
        }
    }
}

struct ListCalculatorInputView_Previews: PreviewProvider {
    static var previews: some View {
        ListCalculatorInputView(item: .constant(Item()), hasSelection: .constant(0), didTapDoneButton: .constant(true))
            .previewLayout(.fixed(width: 220, height: 320))
    }
}
