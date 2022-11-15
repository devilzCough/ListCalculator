//
//  AddButton.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/11/15.
//

import SwiftUI

struct AddButtonView: View {
    
    let addItem: () -> ()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    addItem()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .padding()
                }
                .background(Color.yellow)
                .cornerRadius(25)
                .padding()
            }
        }
        
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView { }
    }
}
