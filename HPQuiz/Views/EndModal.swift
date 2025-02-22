//
//  EndModal.swift
//  HPQuiz
//
//  Created by Louis Gardin on 21/02/2025.
//

import SwiftUI

struct EndModal: View {
    var quiz: Quiz
    @Binding var correctAnswersCount: Int
    @Binding var path: NavigationPath
    
    func getResultText() -> String {
        return correctAnswersCount >= quiz.questions.count / 2 ? "Bravo !" : "Dommage !"
    }
    
    var body: some View {
        Color.black.opacity(0.4).ignoresSafeArea()
        VStack {
            Text(getResultText())
                .font(.title2)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            
            Text("Tu as obtenu \(correctAnswersCount)/\(quiz.questions.count) réponses correctes.")
                .font(.title3)
                .foregroundStyle(.white)
            
            Button("Retour au menu") {
                path.removeLast()
            }
            .buttonStyle(.plain)
            .padding()
            .globalQuestionBackground()
            .cornerRadius(radius: 10)

            
        }
        .padding(.all, 40)
        .globalBackground()
        .cornerRadius(radius: 10)
    }
}
