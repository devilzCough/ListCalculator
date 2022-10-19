//
//  CircleButton.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/13.
//

import SwiftUI

struct CircleImage: View {
    
    var color: Color = .blue
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(color)
                
                Circle()
                    .fill(.white)
                    .frame(width: geometry.size.width * 0.9)
                
                Circle()
                    .fill(color)
                    .frame(width: geometry.size.width * 0.8)
            }
            .offset(y: geometry.size.height / 2 - geometry.size.width / 2)   
        }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(color: .blue)
    }
}
