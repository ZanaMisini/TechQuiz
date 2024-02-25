//
//  SignupController.swift
//  TechQuiz
//
//  Created by Admin on 19.02.24.
//

import Foundation
import UIKit


class SignupController : UIViewController{
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sign Up"
        UIService.loginSignupUI(logo: logo, view: self)
    }
    
    @IBAction func signupAction(_ sender: Any) {
        let username = usernameTF.text ?? ""
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let repeatPassword = repeatPasswordTF.text ?? ""
        let salt = SignupService.generateRandomSalt()
        
        SignupService.signUp(username: username, email: email, password: password, repeatPassword: repeatPassword, salt: salt, signupView: self) { [weak self] message, salt in
            SignupService.showAlert(message: message, viewController: self!)
            
            if message == "User signed up successfully, please Login" {
            DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: "toLogin", sender: self)
                }
            }
        }
    }
}
