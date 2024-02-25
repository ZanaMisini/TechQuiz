//
//  UIService.swift
//  TechQuiz
//
//  Created by Admin on 24.02.24.
//

import Foundation
import UIKit

var BACKGROUND_COLOR = UIColor(red: 62.0/255.0, green: 22.0/255.0, blue: 126.0/255.0, alpha: 1.0)
var BAND_COLOR = UIColor(red: 42.0/255.0, green: 5.0/255.0, blue: 76.0/255.0, alpha: 1.0)
var PINK_FONT = UIColor(red: 234.0/255.0, green: 170.0/255.0, blue: 245.0/255.0, alpha: 1.0)
var RED = UIColor(red: 220.0/255.0, green: 20.0/255.0, blue: 60.0/255.0, alpha: 1.0)
var YELLOW = UIColor(red: 218.0/255.0, green: 165.0/255.0, blue: 32.0/255.0, alpha: 1.0)
var GREEN = UIColor(red: 50.0/255.0, green: 205.0/255.0, blue: 50.0/255.0, alpha: 1.0)

class UIService{
    
    static func loginSignupUI(logo: UIImageView, view: UIViewController){
        logo.image = UIImage(named: "logo")
        view.view.backgroundColor = BACKGROUND_COLOR
    }

    static func mainMenuUI(
        logo: UIImageView, userIcon: UIImageView, goldIcon: UIImageView, silverIcon: UIImageView,
        bronzeIcon: UIImageView, playGame: UIImageView, leaderboard: UIImageView, usernameLabel: UILabel,
        goldScore: UILabel, silverScore: UILabel, easyScore: UILabel, playView: UIView, leaderboardView: UIView,
        bandView: UIView, upperBandView: UIView, view: UIViewController, playButtonOutlet: UIButton, leaderboardButtonOutlet: UIButton
    ){
        view.navigationItem.title = "Main Menu"

        logo.image = UIImage(named: "logo")
        userIcon.image = UIImage(named: "userIcon")
        goldIcon.image = UIImage(named: "gold")
        silverIcon.image = UIImage(named: "silver")
        bronzeIcon.image = UIImage(named: "bronze")
        playGame.image = UIImage(named: "playGameIcon")
        leaderboard.image = UIImage(named: "leaderboardsIcon")

        usernameLabel.textColor = UIColor.white
        goldScore.textColor = UIColor.white
        silverScore.textColor = UIColor.white
        easyScore.textColor = UIColor.white
        playView.backgroundColor = BAND_COLOR
        leaderboardView.backgroundColor = BAND_COLOR
        bandView.backgroundColor = BAND_COLOR
        upperBandView.backgroundColor = BAND_COLOR
        view.view.backgroundColor = BACKGROUND_COLOR
        playButtonOutlet.setTitleColor(PINK_FONT, for: .normal)
        leaderboardButtonOutlet.setTitleColor(PINK_FONT, for: .normal)
        
        usernameLabel.text = userScores?.username
        goldScore.text = "\(userScores!.hard)"
        silverScore.text = "\(userScores!.medium)"
        easyScore.text = "\(userScores!.easy)"
   
        let rotationAngle = -40.0
        let rotationRadians = CGFloat(rotationAngle * .pi / 180.0)
        playGame.transform = CGAffineTransform(rotationAngle: rotationRadians)

    }
    
    static func leaderboardUI(
        goldImage: UIImageView, silverImage: UIImageView, bronzeImage: UIImageView, trophyBackground: UIImageView, viewOutlet: UITextView, easyView: UIView, mediumView: UIView, hardView: UIView, easyButtonOutlet: UIButton, mediumButtonOutlet: UIButton, hardButtonOutlet: UIButton, view: UIViewController
    ){
        view.navigationItem.title = "Leaderboards"

        goldImage.image = UIImage(named: "gold")
        silverImage.image = UIImage(named: "silver")
        bronzeImage.image = UIImage(named: "bronze")
        trophyBackground.image = UIImage(named: "trophy")
        
        view.view.backgroundColor = BACKGROUND_COLOR
        viewOutlet.backgroundColor = BAND_COLOR
        easyView.backgroundColor = BAND_COLOR
        mediumView.backgroundColor = BAND_COLOR
        hardView.backgroundColor = BAND_COLOR
        viewOutlet.textColor = PINK_FONT
        easyButtonOutlet.setTitleColor(PINK_FONT, for: .normal)
        mediumButtonOutlet.setTitleColor(PINK_FONT, for: .normal)
        hardButtonOutlet.setTitleColor(PINK_FONT, for: .normal)
        
        self.setTextViewMiddle(textView: viewOutlet)
        viewOutlet.isEditable = false
        viewOutlet.isSelectable = false
    }
    
    static func playQuizUI(
        diffBackground: UIImageView, brain: UIImageView, tech: UIImageView, difficultyView: UITextView, easyView: UIView, mediumView: UIView, hardView: UIView, view: UIViewController
    ){
        view.navigationItem.title = "Play Quiz"

        diffBackground.image = UIImage(named: "nerd")
        brain.image = UIImage(named: "brain")
        tech.image = UIImage(named: "tech")
        
        view.view.backgroundColor = BACKGROUND_COLOR
        difficultyView.backgroundColor = BAND_COLOR
        easyView.backgroundColor = GREEN
        mediumView.backgroundColor = YELLOW
        hardView.backgroundColor = RED
        difficultyView.textColor = PINK_FONT
        
        self.setTextViewMiddle(textView: difficultyView)
        let rotationAngle = 180.0
        let rotationRadians = CGFloat(rotationAngle * .pi / 180.0)
        diffBackground.transform = CGAffineTransform(rotationAngle: rotationRadians)
        difficultyView.isEditable = false
        difficultyView.isSelectable = false
    }
    

    static func scoresUI(
        bannerView: UITextView, scoresTable: UITableView, view: UIViewController, difficulty: String
    ){
        switch difficulty{
        case "easy": view.navigationItem.title = "Easy Leaderboards"
        case "medium": view.navigationItem.title = "Medium Leaderboards"
        case "hard": view.navigationItem.title = "Hard Leaderboards"
        default: print("Something with setting the title went wrong")
        }
        bannerView.backgroundColor = BAND_COLOR
        view.view.backgroundColor = BACKGROUND_COLOR
        scoresTable.backgroundColor = BACKGROUND_COLOR
        scoresTable.separatorColor = UIColor.white
        
        self.setTextViewMiddle(textView: bannerView)
        bannerView.isEditable = false
        bannerView.isSelectable = false
    }
    
    static func gameUI(
        image1: UIImageView, image2: UIImageView, image3: UIImageView, image4: UIImageView, logo: UIImageView, question: UITextView, view: UIViewController, difficulty: String
    ){
        switch difficulty{
        case "easy": view.navigationItem.title = "Easy Quiz"
        case "medium": view.navigationItem.title = "Medium Quiz"
        case "hard": view.navigationItem.title = "Hard Quiz"
        default: print("Something with setting the title went wrong")
        }
        image1.image = UIImage(named: "answersBackground")
        image2.image = UIImage(named: "answersBackground")
        image3.image = UIImage(named: "answersBackground")
        image4.image = UIImage(named: "answersBackground")
        logo.image = UIImage(named: "logo")
        
        view.view.backgroundColor = BACKGROUND_COLOR
        question.backgroundColor = BAND_COLOR
        
        self.setQuestionMiddle(question: question)
        question.isEditable = false
        question.isSelectable = false
    }
    
    static func setTextViewMiddle(textView: UITextView){
        textView.contentInset = UIEdgeInsets(
            top: (textView.bounds.size.height - textView.contentSize.height * textView.zoomScale) / 2.0,
            left: 0,
            bottom: 0,
            right: 0
        )
    }
    
    static func setQuestionMiddle(question: UITextView){
        let verticalInset = max(0, (question.bounds.size.height - question.contentSize.height * question.zoomScale) / 2.0)
        question.contentInset = UIEdgeInsets(top: verticalInset, left: 0, bottom: 0, right: 0)
    }
}
