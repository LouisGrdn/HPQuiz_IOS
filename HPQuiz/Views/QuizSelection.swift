//
//  QuizSelection.swift
//  HPQuiz
//
//  Created by Louis Gardin on 18/02/2025.
//

import SwiftUI

struct QuizSelection: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List(quizzes, id: \.title) { quiz in
                NavigationLink(quiz.title, value: quiz)
                    .globalQuestionBackground()
            }
            .globalBackground()
            .foregroundStyle(.black)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                                    Text("Liste des quiz")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.top)
                                }
            }
            .navigationDestination(for: Quiz.self) { quiz in
                QuizView(quiz: quiz, quizModel: QuizModel(quiz: quiz), path: $path)
                
            }
        }
    }
}

#Preview {
    QuizSelection()
}
