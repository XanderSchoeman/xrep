//
//  LoginView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/24.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Firebase

class LoginView: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func btnLogin(_ sender: UIButton) {
        var obj = Login(userName: txtUsername.text ?? "", password: txtPassword.text ?? "")
        viewModel.logUserIn(withUser: obj)
        self.showSpinner()
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (_) in
            _ = self.navigationController?.popViewController(animated: true)
            self.removeSpinner()
        }
//        let alert = UIAlertController(title: "Success", message: "Authentication successful", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
//        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
    }
    lazy var viewModel: LoginViewModel = {
        LoginViewModel(with: self, repo: XouBaseApiCalls())
    }()
}
extension LoginView: LoginViewProtocol {
    func notifyUserOnError() {
        let alert = UIAlertController(title: "Failure",
                                      message: "Login unsuccessful, An error has occurred",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(alert, animated: true)
    }
    func notifyUserOnSuccess() {
        let alert = UIAlertController(title: "Success",
                                       message: "Login successful",
                                       preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
         present(alert, animated: true)
    }
    func retrievedLoginData(with: User) {
    }
}
