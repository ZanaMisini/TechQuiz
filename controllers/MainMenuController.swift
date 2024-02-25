//
//  MainMenuController.swift
//  TechQuiz
//
//  Created by Admin on 19.02.24.
//

import Foundation
import UIKit

class MainMenuController: UIViewController{
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var bronzeIcon: UIImageView!
    @IBOutlet weak var silverIcon: UIImageView!
    @IBOutlet weak var goldIcon: UIImageView!
    @IBOutlet weak var upperBandView: UIView!
    @IBOutlet weak var bandView: UIView!
    @IBOutlet weak var playGame: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var silverScore: UILabel!
    @IBOutlet weak var goldScore: UILabel!
    @IBOutlet weak var easyScore: UILabel!
    @IBOutlet weak var leaderboard: UIImageView!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var leaderboardView: UIView!
    @IBOutlet weak var leaderboardButtonOutlet: UIButton!
    @IBOutlet weak var playButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIService.mainMenuUI(logo: logo, userIcon: userIcon, goldIcon: goldIcon, silverIcon: silverIcon, bronzeIcon: bronzeIcon, playGame: playGame, leaderboard: leaderboard, usernameLabel: usernameLabel, goldScore: goldScore, silverScore: silverScore, easyScore: easyScore, playView: playView, leaderboardView: leaderboardView, bandView: bandView, upperBandView: upperBandView, view: self, playButtonOutlet: playButtonOutlet, leaderboardButtonOutlet: leaderboardButtonOutlet)
    }
    
  
    @IBAction func leaderboardsAction(_ sender: Any) {
        self.performSegue(withIdentifier: "leaderboardSegue", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //largo butonin back
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        //update scores nese useri arrine score me te larte sesa ajo te cilen e kishte ne databaze
        UsersScoresService.updateScoreLabels(easyScore: easyScore, silverScore: silverScore, goldScore: goldScore)
        
    }
 
    @IBAction func signoutAction(_ sender: Any) {
        self.performSegue(withIdentifier: "signoutSegue", sender: self)
    }
    
    @IBAction func playQuizAction(_ sender: Any) {
        self.performSegue(withIdentifier: "playSegue", sender: self)
    }
    
}
