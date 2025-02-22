//
//  QuizQuestions.swift
//  HPQuiz
//
//  Created by Louis Gardin on 21/02/2025.
//

import SwiftUI

struct QuizQuestions: View {
    var quiz: Quiz
    @ObservedObject var quizModel: QuizModel
    @State private var pressedAnswer: Answer?
    @Binding var correctAnswersCount: Int
    let resetInterval: () -> Void
    
    func getBackgroundColor(answer: Answer) -> Color {
        let defaultColor = Color(red: 224/255, green: 225 / 255, blue: 221 / 255 )
        guard quizModel.showAnswer else { return defaultColor }
            return answer.isCorrect ? .green : (answer == pressedAnswer ? .red : defaultColor)
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
                        quizModel.selectAnswer(answer) {
                            resetInterval()
                        }
                        pressedAnswer = answer
                        if answer.isCorrect {
                            correctAnswersCount += 1
                        }
                    }
                }) {
                    Text(answer.answer)
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .padding()
                        .background(getBackgroundColor(answer: answer))
                        .globalQuestionBackground()
                        .cornerRadius(radius: 10)
                }
                .buttonStyle(.plain)
                .padding()
            }
        }
    }
}
