//
//  EasyGameController.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation
import UIKit

class GameController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    
    private var mainGameService: MainGameService!
    var difficulty: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIService.gameUI(image1: image1, image2: image2, image3: image3, image4: image4, logo: logo, question: question, view: self, difficulty: difficulty!)

        if let difficulty = difficulty {
            mainGameService = MainGameService(viewController: self, difficulty: difficulty)
        }
        MainGameService.updateUI(view: self, mainGameService: mainGameService, question: question, score: score, answerButton1: answerButton1, answerButton2: answerButton2, answerButton3: answerButton3, answerButton4: answerButton4)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIService.setQuestionMiddle(question: question)
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        MainGameService.asnwerSelectedService(sender, view: self, mainGameService: mainGameService, question: question, score: score, answerButton1: answerButton1, answerButton2: answerButton2, answerButton3: answerButton3, answerButton4: answerButton4)
    }
    
}

