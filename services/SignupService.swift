//
//  SignupService.swift
//  TechQuiz
//
//  Created by Admin on 19.02.24.
//

import Foundation
import UIKit
import CryptoKit
import SQLite3

class SignupService : UIViewController{
    
    static func signUp(username: String, email: String, password: String, repeatPassword: String, salt: String, signupView: UIViewController, showAlert: @escaping (String, String?) -> Void) {
        
            guard !username.isEmpty, !email.isEmpty, !password.isEmpty, !repeatPassword.isEmpty else {
                    showAlert("Ju lutem mbushni te gjitha fushat!", nil)
                    return
            }
        
            guard isValidEmail(email) else {
                showAlert("Ju lutem vendosni nje email valide!", nil)
                return
            }

            guard password.count >= 8 else {
                showAlert("Password-i duhet te kete te pakten 8 karaktere", nil)
                return
            }

            guard username.count <= 10 else {
                showAlert("Username nuk duhet te jete me i gjate se 10 karaktere", nil)
                return
            }

            guard password == repeatPassword else {
                showAlert("Password-at nuk perputhen", nil)
                return
            }

            guard let hashedPassword = hashPassword(password, salt: salt) else {
                showAlert("Error hashing password", nil)
                return
            }

            let dbPointer = DBHelper.getDatabasePointer(databaseName: "tech_quiz.db")
            defer {
                sqlite3_close(dbPointer)
            }

            guard let db = dbPointer else {
                showAlert("Error getting database pointer", nil)
                return
            }

            let usernameExists: Bool = SignupRepository.isUsernameExists(db: db, username: username)
            let emailExists: Bool = SignupRepository.isEmailExists(db: db, email: email)

            if usernameExists {
                showAlert("Ky username eshte ne perdorim, ju lutem zgjedhni nje tjeter", nil)
            } else if emailExists {
                showAlert("Kjo email eshte ne perdorim, ju lutem zgjedhni nje tjeter", nil)
            } else {
                SignupRepository.insertUser(db: db, username: username, email: email, password: hashedPassword, salt: salt)
                SignupRepository.addUserScores(db: db)
                signupView.performSegue(withIdentifier: "toLogin", sender: signupView)
                showAlert("Jeni regjistruar me sukses, ju lutem kycuni", salt)
            }

        }

    private static func hashPassword(_ password: String, salt: String) -> String? {
        let passwordWithSalt = password + salt
        if let passwordData = passwordWithSalt.data(using: .utf8) {
            let hashed = SHA256.hash(data: passwordData)
            return hashed.compactMap { String(format: "%02x", $0) }.joined()
        }
        return nil
    }

    private static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    static func showAlert(message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
        
    static func generateRandomSalt() -> String {
        var buffer = [UInt8](repeating: 0, count: 32)
        _ = SecRandomCopyBytes(kSecRandomDefault, buffer.count, &buffer)

        let salt = Data(buffer).base64EncodedString()
        return salt
    }
}
