//
//  LoginViewController.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/02/14.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtfieldUsername: UITextField!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var txtfieldPassword: UITextField!
    @IBOutlet weak var name: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //txtfieldUsername.frame.height = 5
        //CGRect frameRect = txtfieldUsername.frame;
        //frameRect.size.height = 100; // <-- Specify the height you want here.
        //textField.frame = frameRect;
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Code to make one textField stay in it's content offset if
        //it is already above the keyboard's default popup height
        //if (textField == txtfieldUsername){
        //scrollview.setContentOffset(CGPoint(x:0,y:150), animated: true)
        //}
scrollview.setContentOffset(CGPoint(x: 0, y: 150), animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       hidekeyboard()
        //textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
scrollview.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    func hidekeyboard() { txtfieldUsername.resignFirstResponder()
        txtfieldPassword.resignFirstResponder()
    }
}
