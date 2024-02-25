//
//  UsersScoresModel.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation

class UsersScoresModel{
    let id : Int64
    let username : String
    let easy : Int64
    let medium : Int64
    let hard : Int64
    
    init(id: Int64, username: String, easy: Int64, medium: Int64, hard: Int64){
        self.id = id
        self.username = username
        self.easy = easy
        self.medium = medium
        self.hard = hard
    }
}
