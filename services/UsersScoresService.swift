//
//  UsersScoresService.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation
import SQLite3
import UIKit


class UsersScoresService{
    //Nga repository vendosim metoden ne serivce
    static func getTopScores(difficulty: String, completion: @escaping ([UsersScoresModel]?) -> Void) {
        
           let dbPointer = DBHelper.getDatabasePointer(databaseName: "tech_quiz.db")
           defer {
               sqlite3_close(dbPointer)
           }
        
           guard let db = dbPointer else {
               print("Error getting database pointer")
               completion(nil)
               return
           }
        
           let topEasyScores = UsersScoresRepository.getTopScores(db: db, difficulty: difficulty)
           completion(topEasyScores)
       }
    
    //Metoda per te i update labels me highest scores ne Main Menu
    static func updateScoreLabels(easyScore: UILabel, silverScore: UILabel, goldScore: UILabel){
        if userScores!.easy < newScores[0]{
            easyScore.text = "\(String(describing: newScores[0]))"
        }
        if userScores!.medium < newScores[1]{
            silverScore.text = "\(String(describing: newScores[1]))"
        }
        if userScores!.hard < newScores[2]{
            goldScore.text = "\(String(describing: newScores[2]))"
        }
    }
   
}
