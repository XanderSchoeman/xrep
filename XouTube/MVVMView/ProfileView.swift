//
//  ProfileView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/30.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import Firebase

class ProfileView: UIViewController {
    @IBAction func btnSignIn(_ sender: UIButton) {
        Analytics.logEvent("SignInPressed", parameters: nil)
    }
    @IBAction func btnSignUp(_ sender: UIButton) {
        Analytics.logEvent("SignUpPressed", parameters: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
