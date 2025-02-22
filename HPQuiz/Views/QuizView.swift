//
//  QuizView.swift
//  HPQuiz
//
//  Created by Louis Gardin on 19/02/2025.
//

import SwiftUI

struct QuizView: View {
    var quiz: Quiz
    @ObservedObject var quizModel: QuizModel
    @Binding var path: NavigationPath
    @State private var showEndScreen: Bool = false
    @State private var correctAnswersCount: Int = 0
    
    var body: some View {
        ZStack {
            QuizQuestions(quiz: quiz, quizModel: quizModel, correctAnswersCount: $correctAnswersCount)
            if showEndScreen {
                EndModal(quiz: quiz, correctAnswersCount: $correctAnswersCount, path: $path)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    path.removeLast()
                }) {
                    Text("Retour au menu")
                        .frame(width: 150, height: 50)
                        .globalQuestionBackground()
                        .cornerRadius(radius: 10)
                    }
                .buttonStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: quizModel.isFinished) {
            showEndScreen = quizModel.isFinished
        }
    }
}
