//
//  ProfileView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/30.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Firebase

class ProfileView: UIViewController {

    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblFavouriteCount: UILabel!
    @IBOutlet weak var lblGenrePref: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var stackViewSignInSignUp: UIStackView!
    @IBOutlet weak var stackViewProfile: UIStackView!
    @IBAction func btnSignOut(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.lblUsername.text = ""
            self.lblFullName.text = ""
            self.lblEmail.text = ""
            self.lblGender.text = ""
            self.lblAge.text = "\(0)"
            self.lblGenrePref.text = ""
            self.lblFavouriteCount.text = "\(0)"
        //  if let imageUrl = users.profileImage {
        //  self.imgProfile.loadImageUsingUrlString(urlString: imageUrl)
        //                }
                    }
        isUserLoggedIn = false
        stackViewProfile.isHidden = true
        stackViewSignInSignUp.isHidden = false
    }
    @IBAction func btnSignIn(_ sender: UIButton) {
        Analytics.logEvent("SignInPressed", parameters: nil)
        performSegue(withIdentifier: "segSignIn", sender: self)
    }
    @IBAction func btnSignUp(_ sender: UIButton) {
        Analytics.logEvent("SignUpPressed", parameters: nil)
        performSegue(withIdentifier: "segSignUp", sender: self)
    }
    public var user = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewSignInSignUp.isHidden = false
        stackViewProfile.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        if (isUserLoggedIn) {
            stackViewSignInSignUp.isHidden = true
            stackViewProfile.isHidden = false
            var users = loggedInUser
            DispatchQueue.main.async {
            self.lblUsername.text = users.username
            self.lblFullName.text = users.fullName
            self.lblEmail.text = users.email
            self.lblGender.text = users.gender
            self.lblAge.text = "\(users.age)"
            self.lblGenrePref.text = users.genrePref
            self.lblFavouriteCount.text = "\(users.favouriteCount)"
        //                if let imageUrl = users.profileImage {
        //                    self.imgProfile.loadImageUsingUrlString(urlString: imageUrl)
        //                }
                    }
            }
    }

}
