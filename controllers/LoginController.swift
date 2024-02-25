//
//  LoginController.swift
//  TechQuiz
//
//  Created by Admin on 19.02.24.
//

import Foundation
import UIKit

class LoginController : UIViewController{

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Login"
        UIService.loginSignupUI(logo: logo, view: self)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let username = usernameTF.text ?? ""
        let password = passwordTF.text ?? ""
        LoginService.performLogin(username: username, password: password, viewController: self)
    }
    
    @IBAction func signupAction(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}
