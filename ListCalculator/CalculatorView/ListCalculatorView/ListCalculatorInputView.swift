//
//  ListCalculatorInputView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

enum Field: Hashable {
    case nameField
    case priceField
    case countField
}

struct ListCalculatorInputView: View {
    
    @Binding var item: Item
    
    @Binding var hasSelection: Int?
    @Binding var didTapDoneButton: Bool
    
    @FocusState private var focusedField: Field?
    
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
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .priceField
                }
                .focused($focusedField, equals: .nameField)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        focusedField = .nameField
                    }
                }
            
            TextField("금액", value: $item.price, formatter: priceFormatter)
                .keyboardType(.numberPad)
                .submitLabel(.done)
                .onSubmit {
                    focusedField = nil
                }
                .focused($focusedField, equals: .priceField)
            
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
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(BorderlessButtonStyle())
                
                Divider()
                
                Button("Done") {
                    didTapDoneButton = true
                    hasSelection = nil
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
