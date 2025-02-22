//
//  ThemeModifier.swift
//  HPQuiz
//
//  Created by Louis Gardin on 20/02/2025.
//

import SwiftUI

struct GlobalBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(red: 64 / 255, green: 90 / 255, blue: 119 / 255).ignoresSafeArea())
    }
}

struct GlobalQuestionBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(red: 224/255, green: 225 / 255, blue: 221 / 255 ))
            .listRowBackground(Color(red: 224/255, green: 225 / 255, blue: 221 / 255 ))
            .foregroundStyle(.black)
    }
}

extension View {
    public func globalBackground() -> some View {
        self.modifier(GlobalBackground())
    }
    
    public func globalQuestionBackground() -> some View {
        self.modifier(GlobalQuestionBackground())
    }
}
