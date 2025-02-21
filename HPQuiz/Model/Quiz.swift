import Foundation

struct Answer: Hashable, Codable {
    var answer: String
    var isCorrect: Bool
}

struct Question: Hashable, Codable {
    var prompt: String
    var answers: [Answer]
}

struct Quiz: Hashable, Codable {
    var title: String
    var duration: Int
    var stars: Int
    var description: String
    var questions: [Question]
}

class QuizModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var isCorrect: Bool?
    @Published var showAnswer: Bool = false

    var quiz: Quiz

    init(quiz: Quiz) {
        self.quiz = quiz
    }

    var currentQuestion: Question {
        quiz.questions[currentQuestionIndex]
    }

    func selectAnswer(_ answer: Answer) {
        isCorrect = answer.isCorrect
        showAnswer = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.nextQuestion()
        }
    }

    func nextQuestion() {
        if currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
            isCorrect = nil
            showAnswer = false
        }
    }
}
