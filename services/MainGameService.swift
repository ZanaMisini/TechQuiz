
import Foundation
import UIKit

var newScores: [Int] = [0, 0, 0]

class MainGameService {

    private var questionsArray: [QuestionsModel]
    private var currentIndex: Int = 0
    private var score: Int = 0
    private weak var viewController: UIViewController?
    private var difficulty: String?

    init(viewController: UIViewController, difficulty: String) {
        //Varesisht nga veshtiresia e selektuar, shfaqim pyetjet
        self.difficulty = difficulty
        switch difficulty {
        case "easy":
            questionsArray = QuestionsService.easyQuestions()
        case "medium":
            questionsArray = QuestionsService.mediumQuestions()
        case "hard":
            questionsArray = QuestionsService.hardQuestions()
        default:
            questionsArray = []
        }

        //Paraqesim pyetjet ne menyre te rastesishme
        questionsArray.shuffle()
        self.viewController = viewController
    }

    func handleAnswer(selectedAnswer: String, view: UIViewController, navigationController: UINavigationController?) -> Bool {

        let currentQuestion = getCurrentQuestion()
        //Nqs pyetja e selektuar (nga teksti ne butonin e prekur), == me correctAnswer nga pyetja e marre nga QuestionModel
        if selectedAnswer == currentQuestion.correctAnswer {
            
            //Nqs ka ende pyetje qe nuk jane shfaqur
            if currentIndex < questionsArray.count - 1 {
                switch difficulty {
                //Per secilen veshtiresi japim score te ndryshme
                case "easy": score += 1
                case "medium": score += 2
                case "hard": score += 3
                default:
                    print("something with updating the score went wrong")
                }
                //Rrisim index per te vazhduar te pyetja tjeter
                currentIndex += 1
              
                return true // Pergjigjja eshte e sakte, vazhdojme tek tjetra
            }
            else {
                // Nuk ka me pyetje, vazhdojme nga fillimi
                
                switch difficulty {
                //Update score-en
                case "easy": score += 1
                case "medium": score += 2
                case "hard": score += 3
                default:
                    print("something with updating the score went wrong")
                }
                //Rivendosim indexin ne 0
                currentIndex = 0

                return true //Pyetja e sakte, vazhdojme tek tjetra
            }
        } else {
            //Pyetja eshte pergjigjur gabim!
            view.view.isUserInteractionEnabled = false
            
            //Update score varesisht nga difficulty
            if(difficulty == "easy"){
                //Score behet update nqs user ka marre score me te larte sesa ajo qe ka pasur ne databaze kur eshte kycur, ose me e larte se ndonje score qe e ka marrur para se te shkycet dhe kycet perseri
                if score > userScores!.easy && score > newScores[0]{
                    //Vendosim ne array highest score te re te fituar
                    newScores[0] = score
                    UsersScoresRepository.updateScoreInDatabase(username: userScores!.username, difficulty:difficulty!, newScore: score)
                }
            }else if(difficulty == "medium"){
                if score > userScores!.medium && score > newScores[1]{
                    newScores[1] = score
                    UsersScoresRepository.updateScoreInDatabase(username: userScores!.username, difficulty:difficulty!, newScore: score)
                }
            }else{
                if score > userScores!.hard && score > newScores[2]{
                    newScores[2] = score
                    UsersScoresRepository.updateScoreInDatabase(username: userScores!.username, difficulty:difficulty!, newScore: score)
                }
            }
            //Pas dy sekondave, kthehemi prapa ne Main Menu
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                navigationController?.popViewController(animated: true)
            }
            showGameOverAlert(message: "Loja mbaroi. Keni dhene pergjigje te gabuar. Final Score: \(score)")
            
            return false // Pergjigja e gabuar );
        }
    }

    private func showGameOverAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alert.title = "Game Over ;("
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    static func updateUI(
        view: UIViewController, mainGameService: MainGameService?, question: UITextView, score: UILabel,
        answerButton1: UIButton, answerButton2: UIButton, answerButton3: UIButton, answerButton4: UIButton
    ) {
        //Nuk e lejojme userin te veproje me screen pasi te kete selektuar nje pergjigje
        view.view.isUserInteractionEnabled = true
        //Vendosim pyetjen e rradhes
        guard let currentQuestion = mainGameService?.getCurrentQuestion() else {
            print("Error: Unable to retrieve current question.")
            return
        }

        question.text = currentQuestion.question
        score.text = "\(mainGameService!.getScore())"


        //Vendosim pergjigjet ne menyre te rastesishme
        let randomizedAnswers = [currentQuestion.correctAnswer, currentQuestion.wrongAnswer1, currentQuestion.wrongAnswer2, currentQuestion.wrongAnswer3].shuffled()

        //Vendosim pergjigjet ne butona
        answerButton1.setTitle(randomizedAnswers[0], for: .normal)
        answerButton2.setTitle(randomizedAnswers[1], for: .normal)
        answerButton3.setTitle(randomizedAnswers[2], for: .normal)
        answerButton4.setTitle(randomizedAnswers[3], for: .normal)
    }
    
    static func asnwerSelectedService(
        _ sender: UIButton, view: UIViewController, mainGameService: MainGameService?, question: UITextView,
        score: UILabel, answerButton1: UIButton, answerButton2: UIButton, answerButton3: UIButton, answerButton4: UIButton
        ) {
        //Duke perdorur tag, marrim pergjigjen e zgjedhur
        guard let selectedAnswer = sender.titleLabel?.text else {
                return
            }

            //Nga metodat ne MainGameService shqyrtohet nqs pergjigja eshte e sakte
            let isCorrect = mainGameService?.handleAnswer(selectedAnswer: "\(selectedAnswer)", view: view, navigationController: view.navigationController)

            //Update UI varesisht nga pergjigja
            if isCorrect! {
                view.view.isUserInteractionEnabled = false
                question.text = "CORRECT!!!"
                sender.backgroundColor = UIColor.green

                // Delay 2 sekonda para se te bejme update UI
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    sender.backgroundColor = UIColor.clear
                    self.updateUI(view: view, mainGameService: mainGameService, question: question, score: score, answerButton1: answerButton1, answerButton2: answerButton2, answerButton3: answerButton3, answerButton4: answerButton4)
                }
            } else {
                question.text = "incorrect answer ;("
                sender.backgroundColor = UIColor.red
            }
    }
    
    func getCurrentQuestion() -> QuestionsModel {
        //Marrim pyetjen aktuale, indexi percaktohet nga metoda handleAnswer
        return questionsArray[currentIndex]
    }

    func getScore() -> Int {
        return score
    }
}
