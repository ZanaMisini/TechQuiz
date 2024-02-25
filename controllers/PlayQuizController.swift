//
//  PlayQuizController.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation
import UIKit

class PlayQuizController : UIViewController{
    
    @IBOutlet weak var difficultyView: UITextView!
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var easyView: UIView!
    @IBOutlet weak var hardView: UIView!
    @IBOutlet weak var diffBackground: UIImageView!
    @IBOutlet weak var tech: UIImageView!
    @IBOutlet weak var brain: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIService.playQuizUI(diffBackground: diffBackground, brain: brain, tech: tech, difficultyView: difficultyView, easyView: easyView, mediumView: mediumView, hardView: hardView, view: self)
    }
    
    @IBAction func easyGameAction(_ sender: Any) {
        self.performSegue(withIdentifier: "gameSegue", sender: "easy")
    }
    
    @IBAction func mediumGameAction(_ sender: Any) {
        self.performSegue(withIdentifier: "gameSegue", sender: "medium")
    }
    
    @IBAction func hardGameAction(_ sender: Any) {
        self.performSegue(withIdentifier: "gameSegue", sender: "hard")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "gameSegue",
          let destination = segue.destination as? GameController,
          let difficulty = sender as? String {
           destination.difficulty = difficulty
       }
   }
}
