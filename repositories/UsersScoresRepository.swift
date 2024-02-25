//
//  UsersScoresRepository.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation
import SQLite3

class UsersScoresRepository{
        
    //Metoda per te i marre te gjitha te dhenat e userit kur ai log-ohet, ashtu qe te mund te i perdorim te dhenat e tij kudo ne aplikacion
    static func getUserScores(db: OpaquePointer?, username: String, completion: @escaping (UsersScoresModel?) -> Void) {
            guard let db = db else {
                print("Database pointer is nil")
                completion(nil)
                return
            }

            let query = "SELECT users.id, easy, medium, hard FROM users JOIN scores ON users.id = scores.id WHERE username = ?"
            var statement: OpaquePointer? = nil

            if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
                sqlite3_bind_text(statement, 1, username, -1, nil)

                if sqlite3_step(statement) == SQLITE_ROW {
                    let userId = sqlite3_column_int64(statement, 0)
                    let easy = sqlite3_column_int64(statement, 1)
                    let medium = sqlite3_column_int64(statement, 2)
                    let hard = sqlite3_column_int64(statement, 3)
                    
                    //I vendosim te dhenat e userit te log-uar ne variablen globale userScores duke perdorur modelin e krijuar
                    let userScores = UsersScoresModel(id: userId, username: username, easy: easy, medium: medium, hard: hard)
                    completion(userScores)
                } else {
                    completion(nil)
                }
            } else {
                print("Error preparing query statement")
                completion(nil)
            }

            sqlite3_finalize(statement)
        }
    
    //Marrim te gjitha scores per ti vendosur ne TableView te Leaderboards
    static func getTopScores(db: OpaquePointer?, difficulty: String) -> [UsersScoresModel] {
        guard let db = db else {
            print("Database pointer is nil")
            return []
        }

        let query = "SELECT users.id, username, easy, medium, hard FROM users JOIN scores ON users.id = scores.id ORDER BY \(difficulty) DESC"
        var statement: OpaquePointer? = nil
        var topScores: [UsersScoresModel] = []

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let userId = sqlite3_column_int64(statement, 0)
                let username = String(cString: sqlite3_column_text(statement, 1))
                let easy = sqlite3_column_int64(statement, 2)
                let medium = sqlite3_column_int64(statement, 3)
                let hard = sqlite3_column_int64(statement, 4)

                let scores = UsersScoresModel(id: userId, username: username, easy: easy, medium: medium, hard: hard)
                topScores.append(scores)
            }
        } else {
            print("Error preparing query statement")
        }

        sqlite3_finalize(statement)
        DBHelper.closeDatabase(dbPointer: db)
        return topScores
    }
    
    //Nqs useri arrin ndonje score me te larte se ajo aktualisht ne databaze
    static func updateScoreInDatabase(username: String, difficulty: String, newScore: Int) {
        let dbPath = DBHelper.getDatabasePath(databaseName: "tech_quiz.db")
        
        var dbPointer: OpaquePointer? = nil
        //SQLite3 ka constraints, duhet te mundesojme qe disa threads te mund te i casen njekohesisht
        if sqlite3_open_v2(dbPath, &dbPointer, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE | SQLITE_OPEN_FULLMUTEX, nil) == SQLITE_OK {
            var statement: OpaquePointer?

            let updateQuery = """
                UPDATE scores
                SET \(difficulty) = ?
                WHERE scores.id = (SELECT id FROM users WHERE username = ?)
            """

            if sqlite3_prepare_v2(dbPointer, updateQuery, -1, &statement, nil) == SQLITE_OK {
                sqlite3_bind_int(statement, 1, Int32(newScore))
                sqlite3_bind_text(statement, 2, username, -1, nil)

                if sqlite3_step(statement) == SQLITE_DONE {
                    print("Score updated successfully")
                } else {
                    print("Failed to update score")
                    let errorMessage = String(cString: sqlite3_errmsg(dbPointer))
                    print("Error updating score: \(errorMessage)")
                }
            } else {
                print("Error preparing update statement")
                let errorMessage = String(cString: sqlite3_errmsg(dbPointer))
                print("Error: \(errorMessage)")
            }

            sqlite3_finalize(statement)
            sqlite3_close(dbPointer)
        } else {
            print("Error opening database")
        }
    }

}


