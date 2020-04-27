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
        var userFirst = User(gender: txtGender.text ?? "",
                             password: txtPassword.text ?? "", profileImage: "",
                             age: Int(txtAge.text ?? "0") ?? 0,
                             favouriteCount: Int(txtFavouriteCount.text ?? "0") ?? 0,
                             fullName: txtFullName.text ?? "",
                             username: txtUsername.text ?? "",
                             email: txtEmail.text ?? "",
                             genrePref: txtGenrePref.text ?? "Action")
 
        let xouCalls = XouBaseApiCalls()
        xouCalls.registerUser(theUser: userFirst, completetionHandler: { result in
            switch result {
            case .success(let user):
                print("Succes the user: \(user.username) has been registered")
            case .failure(let error):
                print("An error has occured: \(error)")
            }
        })

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
