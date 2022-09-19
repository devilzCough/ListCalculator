//
//  View+popup.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/17.
//

import Foundation

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
