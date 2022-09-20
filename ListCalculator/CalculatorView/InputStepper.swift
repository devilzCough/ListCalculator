//
//  InputStepper.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/20.
//

import SwiftUI

struct InputStepper: View {
    
    @Binding var count: Int
    
    var body: some View {
        HStack(spacing: 0) {

            Button {
                if count > 0 {
                    count -= 1
                }
            } label: {
                Image(systemName: "minus")
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(10)
            
            Divider()
                .padding([.top, .bottom], 8)

            TextField("수량", value: $count, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .frame(width: 30)
            
            Divider()
                .padding([.top, .bottom], 8)
            
            Button {
                count += 1
            } label: {
                Image(systemName: "plus")
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(10)
            

        }
        .background(Color(.quaternarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct InputStepper_Previews: PreviewProvider {
    static var previews: some View {
        InputStepper(count: .constant(0))
    }
}
