//
//  Test_ContentView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/14.
//

import SwiftUI

struct Test_ContentView: View {
    
    @State var showingPopup = false
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.2)
            Button("Push me") {
                showingPopup = true
            }
        }
        .popup(isPresented: $showingPopup) {
            ZStack {
                Color.blue.frame(width: 200, height: 100)
                Text("Popup!")
            }
        }
    }
}

struct Test_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Test_ContentView()
    }
}

extension View {
    public func popup<PopupContent: View>(isPresented: Binding<Bool>,
                                          view: @escaping () -> PopupContent) -> some View {
        self.modifier(
            Popup(
                isPresented: isPresented,
                view: view
            )
        )
    }
}
