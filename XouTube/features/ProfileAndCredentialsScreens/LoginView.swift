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
    func retrieveLoginData(with: User) {
    }
}
