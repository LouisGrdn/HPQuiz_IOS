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
    @State private var pressedAnswer: Answer?
    @Binding var path: NavigationPath

    func getBackgroundColor(answer: Answer) -> Color {
        let defaultColor = Color(red: 224/255, green: 225 / 255, blue: 221 / 255 )
        guard quizModel.showAnswer else { return defaultColor }
            return answer.isCorrect ? .green : (answer == pressedAnswer ? .red : defaultColor)
    }

    func returnToHome() {
        if quizModel.currentQuestionIndex == 1 {
            path.removeLast()
        }
    }

    var body: some View {
        VStack {
            Text(quizModel.currentQuestion.prompt)
                .font(.title2)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            ForEach(quizModel.currentQuestion.answers, id: \.self) { answer in
                Button(action: {
                    if !quizModel.showAnswer {
                        quizModel.selectAnswer(answer)
                        pressedAnswer = answer
                    }
                }) {
                    Text(answer.answer)
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .padding()
                        .background(getBackgroundColor(answer: answer))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                            )
                }
                .buttonStyle(.plain)
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .globalBackground()
        .ignoresSafeArea()
    }
}
