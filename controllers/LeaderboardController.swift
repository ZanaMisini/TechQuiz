//
//  LeaderboardController.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation
import UIKit


class LeaderboardController : UIViewController{
    
    @IBOutlet weak var viewOutlet: UITextView!
    @IBOutlet weak var easyView: UIView!
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var hardView: UIView!
    @IBOutlet weak var easyButtonOutlet: UIButton!
    @IBOutlet weak var mediumButtonOutlet: UIButton!
    @IBOutlet weak var hardButtonOutlet: UIButton!
    @IBOutlet weak var trophyBackground: UIImageView!
    @IBOutlet weak var bronzeImage: UIImageView!
    @IBOutlet weak var silverImage: UIImageView!
    @IBOutlet weak var goldImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIService.leaderboardUI(goldImage: goldImage, silverImage: silverImage, bronzeImage: bronzeImage, trophyBackground: trophyBackground, viewOutlet: viewOutlet, easyView: easyView, mediumView: mediumView, hardView: hardView, easyButtonOutlet: easyButtonOutlet, mediumButtonOutlet: mediumButtonOutlet, hardButtonOutlet: hardButtonOutlet, view: self)
    }
    
    @IBAction func eeasyAction(_ sender: Any) {
        showScoresController(withDifficulty: "easy")
    }
    
    @IBAction func mmediumAction(_ sender: Any) {
        showScoresController(withDifficulty: "medium")
    }
    
    @IBAction func hhardAction(_ sender: Any) {
        showScoresController(withDifficulty: "hard")
    }
    
    private func showScoresController(withDifficulty difficulty: String) {
        let scoresController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScoresController") as! ScoresController
        scoresController.difficulty = difficulty
        self.navigationController?.pushViewController(scoresController, animated: true)
    }

}
