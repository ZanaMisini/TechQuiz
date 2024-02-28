//
//  SignupRepository.swift
//  TechQuiz
//
//  Created by Admin on 19.02.24.
//

import Foundation
import SQLite3

class SignupRepository{
    
    //Metoda per te vendosur nje user ne databaze, perdoret gjate Sign Up
    static func insertUser(db: OpaquePointer?, username: String, email: String, password: String, salt: String) {
        guard let db = db else {
            print("Database pointer is nil")
            return
        }

        defer {
            sqlite3_finalize(statement)
        }

        let insertSQL = "INSERT INTO users (username, email, password, salt) VALUES (?, ?, ?, ?)"

        var statement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, insertSQL, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, username, -1, nil)
            sqlite3_bind_text(statement, 2, email, -1, nil)
            sqlite3_bind_text(statement, 3, password, -1, nil)
            sqlite3_bind_text(statement, 4, salt, -1, nil)

            if sqlite3_step(statement) == SQLITE_DONE {
                print("Successfully inserted user")
            } else {
                print("Error inserting user")
            }
        } else {
            print("Error preparing insert statement")
        }

        
    }
    
    //Metoda per te vendosur nje rresht te ri ne tabelen scores, kjo metode thirret secilen here qe nje user regjistrohet ne App, ashtu qe te kete rekordin e tij perkates per highest scores e fituara
    static func addUserScores(db: OpaquePointer?) {
        guard let db = db else {
            print("Database pointer is nil")
            return
        }

        defer {
            sqlite3_finalize(statement)
        }

        let insertSQL = "INSERT INTO scores (easy) VALUES (?)"

        var statement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, insertSQL, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, 0) // your default value for easy score

            if sqlite3_step(statement) == SQLITE_DONE {
                print("Successfully inserted user scores")
            } else {
                print("Error inserting user scores")
            }
        } else {
            print("Error preparing insert scores statement")
        }

        
    }

        
    //Metoda per validim gjate signup, se a ekziston ndonje username i njejte me ate te cilin deshiron te regjistrohet useri
    static func isUsernameExists(db: OpaquePointer?, username: String) -> Bool {
        let query = "SELECT COUNT(*) FROM users WHERE username = ?"
        var statement: OpaquePointer? = nil

        defer {
            sqlite3_finalize(statement)
        }

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, username, -1, nil)

            if sqlite3_step(statement) == SQLITE_ROW {
                let count = sqlite3_column_int(statement, 0)
                return count > 0
            } else {
                print("Error executing query: \(query)")
            }
        } else {
            print("Error preparing query statement: \(query)")
        }

        return false
    }

    //Metoda per validim gjate signup, se a ekziston ndonje email i njejte me ate te cilin deshiron te regjistrohet useri
    static func isEmailExists(db: OpaquePointer?, email: String) -> Bool {
        let query = "SELECT COUNT(*) FROM users WHERE email = ?"
        var statement: OpaquePointer? = nil

        defer {
            sqlite3_finalize(statement)
        }

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, email, -1, nil)

            if sqlite3_step(statement) == SQLITE_ROW {
                let count = sqlite3_column_int(statement, 0)
                return count > 0
            } else {
                print("Error executing query: \(query)")
            }
        } else {
            print("Error preparing query statement: \(query)")
        }

        return false
    }
    
}
