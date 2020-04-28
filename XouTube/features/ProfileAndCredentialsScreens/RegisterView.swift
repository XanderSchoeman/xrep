//
//  RegisterView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/24.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Firebase

class RegisterView: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtFavouriteCount: UITextField!
    @IBOutlet weak var txtGenrePref: UITextField!
    @IBAction func btnRegister(_ sender: UIButton) {
        var user = User(gender: txtGender.text ?? "",
                             password: txtPassword.text ?? "", profileImage: "",
                             age: Int(txtAge.text ?? "0") ?? 0,
                             fullName: txtFullName.text ?? "",
                             username: txtUsername.text ?? "",
                             email: txtEmail.text ?? "",
                             genrePref: txtGenrePref.text ?? "Action")
        viewModel.registerAUser(withUser: user)
        self.showSpinner()
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (_) in
            _ = self.navigationController?.popViewController(animated: true)
            self.removeSpinner()
        }
        let alert = UIAlertController(title: "Success", message: "Registration successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    lazy var viewModel: RegisterViewModel = {
        RegisterViewModel(with: self, repo: XouBaseApiCalls())
    }()
}
extension RegisterView: RegisterViewProtocol {
    func retrieveRegisterData(with: User) {
    }
}
