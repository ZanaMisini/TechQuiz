import Foundation
import SQLite3
import UIKit

//Variabla globale per te marre te dhenat e userit kur te kycet
var userScores: UsersScoresModel?
//Variablat ndihmese per te update score te userit ne Main Menu nqs arrine ndonje me te larte pasi te kycet
var newScoreEasy: Int? = 0
var newScoreMedium: Int? = 0
var newScoreHard: Int? = 0

class LoginService {
    
    static func performLogin(username: String, password: String, viewController: UIViewController) {
        
        guard !username.isEmpty, !password.isEmpty else {
            showAlert(from: viewController, message: "Ju lutem mbushni te gjitha fushat!")
            return
        }
        guard let dbPointer: OpaquePointer = DBHelper.getDatabasePointer(databaseName: "tech_quiz.db") else {
            showAlert(from: viewController, message: "UH-OH! Something wrong happened")
            return
        }
        
        let isLogged: Bool = LoginRepository.loginUser(db: dbPointer, username: username, enteredPassword: password)
        if isLogged {
            UsersScoresRepository.getUserScores(db: dbPointer, username: username) { receivedUserScores in
                if let receivedUserScores = receivedUserScores {
                    //Ketu vendosim te dhenat e userit ne variablen globale
                    userScores = receivedUserScores
                } else {
                    print("User not found or an error occurred while fetching data.")
                }
            }

            viewController.performSegue(withIdentifier: "afterLogin", sender: viewController)
        } else {
            showAlert(from: viewController, message: "Ky user nuk ekziston. Provoni perseri.")
        }
        
    }

    private static func showAlert(from viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
