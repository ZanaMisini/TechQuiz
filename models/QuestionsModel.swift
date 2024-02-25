//
//  QuestionsModel.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation

class QuestionsModel{
    var id : Int64
    var question : String
    var correctAnswer : String
    var wrongAnswer1 : String
    var wrongAnswer2 : String
    var wrongAnswer3 : String
    
    init(id: Int64, question: String, correctAnswer: String, wrongAnswer1: String, wrongAnswer2: String, wrongAnswer3: String) {
        self.id = id
        self.question = question
        self.correctAnswer = correctAnswer
        self.wrongAnswer1 = wrongAnswer1
        self.wrongAnswer2 = wrongAnswer2
        self.wrongAnswer3 = wrongAnswer3
        
    }
}
