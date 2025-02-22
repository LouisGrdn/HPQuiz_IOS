//
//  UtilsModifier.swift
//  HPQuiz
//
//  Created by Louis Gardin on 22/02/2025.
//

import SwiftUI

struct CornerRadius: ViewModifier {
    var radius: CGFloat
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .overlay(RoundedRectangle(cornerRadius: radius)
                .stroke(.black, lineWidth: 2)
                )
    }
}

extension View {
    public func cornerRadius(radius: CGFloat) -> some View {
        self.modifier(CornerRadius(radius: radius))
    }
}
