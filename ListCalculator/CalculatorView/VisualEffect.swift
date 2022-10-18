//
//  BlurEffect.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/10/18.
//

import UIKit
import SwiftUI

struct VisualEffect: UIViewRepresentable {
    
    var effect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        
        uiView.effect = effect
    }
}
