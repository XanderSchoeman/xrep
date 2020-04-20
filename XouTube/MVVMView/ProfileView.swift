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
    @IBAction func btnSignIn(_ sender: UIButton) {
        //Analytics.logEvent("SignInPressed", parameters: nil)
        performSegue(withIdentifier: "segSignIn", sender: self)
    }
    @IBAction func btnSignUp(_ sender: UIButton) {
        //Analytics.logEvent("SignUpPressed", parameters: nil)
        performSegue(withIdentifier: "segSignUp", sender: self)
    }
    public var user = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiCaller = XouBaseApiCalls()
        apiCaller.getUsers { [weak self] result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let users):
                self?.user = users
                DispatchQueue.main.async {
                    self?.lblUsername.text = users[0].username
                    self?.lblFullName.text = users[0].fullName
                    self?.lblEmail.text = users[0].email
                    self?.lblGender.text = users[0].gender
                    self?.lblAge.text = "\(users[0].age ?? 18)"
                    self?.lblGenrePref.text = users[0].genrePref
                    self?.lblFavouriteCount.text = "\(users[0].favouriteCount ?? 0)"
                    if let imageUrl = users[0].profileImage {
                        self?.imgProfile.loadImageUsingUrlString(urlString: imageUrl)
                    }
                }
        }
        }
    }

}
