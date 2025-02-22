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
    @State private var startInterval = Date()
    @State private var endInterval = Date().addingTimeInterval(20)
    @State private var isTimeRunningOut: Bool = false
    
    func resetInterval() {
        startInterval = Date()
        endInterval = Date().addingTimeInterval(20)
    }
    
    var body: some View {
        ZStack {
            VStack {
                ProgressView(timerInterval: startInterval...endInterval)
                    .tint(Color(red: 224/255, green: 225 / 255, blue: 221 / 255 ))
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                QuizQuestions(quiz: quiz, quizModel: quizModel, correctAnswersCount: $correctAnswersCount, resetInterval: resetInterval)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .globalBackground()
            .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
                if Date() >= endInterval {
                    isTimeRunningOut = true
                    }
                }
            if showEndScreen || isTimeRunningOut {
                EndModal(quiz: quiz, correctAnswersCount: $correctAnswersCount, path: $path, isTimeOver: $isTimeRunningOut)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    path.removeLast()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Retour au menu")
                    }
                    .foregroundStyle(.white)
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
