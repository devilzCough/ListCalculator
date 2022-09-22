//
//  CenterTabView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct CenterTabView: View {
    
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: size, height: size)
            
            Circle()
                .foregroundColor(.yellow)
                .frame(width: size * 0.9, height: size * 0.9)
        }
    }
}

struct CenterTabView_Previews: PreviewProvider {
    static var previews: some View {
        CenterTabView(size: 50)
    }
}
