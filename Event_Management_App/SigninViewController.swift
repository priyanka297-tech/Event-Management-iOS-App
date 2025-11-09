//  SigninViewController.swift
//  Event_Management_App
//  Created by WCTM 08 on 14/10/24.

import UIKit
import FirebaseCore
import FirebaseDatabase

class signinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var emailid: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        //        errorLabel.isHidden = true
    }
    
    @IBAction func register(_ sender: UIButton) {
    if (username.text != "" && emailid.text != "" && password.text != "" && confirmPassword.text != "" && phoneNo.text != "" && lastname.text != ""){
            
            if (password.text == confirmPassword.text) {
                
                let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                
                self.ref.child("Users Details").child(username.text!).setValue([
                    "First Name": username.text,
                    "EmailId": emailid.text,
                    "Password": password.text,
                    "confirmPassword": confirmPassword.text,
                    "phoneNo": phoneNo.text,
                    "Last Name": lastname.text
                ])
                self.ref.child("User Auth").child(emailid.text!).setValue(password.text)
                
//                let UserName = username.text
//                vc.name += UserName!
                self.navigationController?.pushViewController(vc, animated: true)
                
                
//                self.ref.child("User Auth").child(emailid.text!).setValue(password.text)
//                
//                let UserName = username.text
//                vc.name += UserName!
//                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }}
    
    @IBAction func login(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
    
}
        
               

