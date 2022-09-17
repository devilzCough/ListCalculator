//
//  CalculateResultView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/17.
//

import SwiftUI

struct CalculateResultView: View {
    
    @Binding var items: [Item]
    
    var checkedItems: [Item] {
        items.filter { item in
            item.isChecked
        }
    }
    
    var totalPrice: Int {
        checkedItems.reduce(0) { partialResult, item in
            partialResult + item.price * item.count
        }
    }
    
    var body: some View {
        HStack {
            Text("항목 \(checkedItems.count)개")
                .frame(maxWidth: .infinity)
            Text("총 \(totalPrice)원")
                .frame(maxWidth: .infinity)
        }
        .font(.title3)
        .frame(maxHeight: 60)
        .background(Color.yellow)
    }
}

struct CalculateResultView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateResultView(items: .constant([]))
    }
}
