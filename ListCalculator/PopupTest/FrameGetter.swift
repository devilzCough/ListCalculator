//
//  FrameGetter.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI


extension View {
    func frameGetter(_ frame: Binding<CGRect>) -> some View {
        modifier(FrameGetter(frame: frame))
    }
}

struct FrameGetter: ViewModifier {
    @Binding var frame: CGRect
        
        func body(content: Content) -> some View {
            content
                .background(
                    GeometryReader { proxy -> AnyView in
                        let rect = proxy.frame(in: .global)
                        // This avoids an infinite layout loop
                        if rect.integral != self.frame.integral {
                            DispatchQueue.main.async {
                                self.frame = rect
                            }
                        }
                    return AnyView(EmptyView())
                })
        }
}

//struct FrameGetter_Previews: PreviewProvider {
//    static var previews: some View {
//        FrameGetter()
//    }
//}
