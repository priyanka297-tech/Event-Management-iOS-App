//
//  LoginViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 14/10/24.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var emailId = [String]()
    var emailPass = [String]()
    
    var ref : DatabaseReference!
    var databaseHandle : DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        databaseHandle = ref?.child("User Auth").observe(.childAdded, with: {(snapshot) in
            let validId = snapshot.value as? String
            if let actualId = validId{
                self.emailId.append(actualId)
            }
            
            let validPass = snapshot.value as? String
            if let actualPass = validPass{
                self.emailPass.append(actualPass)
            }
        })
        
        print(emailId)
        print(emailPass)
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        if(email.text != "" && password.text != ""){
            let limitset = emailId.count - 1
            for i in 0...limitset{
                if(email.text == emailId[i]){
                    if(password.text == emailPass[i]){
                        let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
        
    }
    
    @IBAction func signin(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "signinViewController") as! signinViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgetpass(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "forgetPasswordViewController") as! forgetPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    }
    

    

    


    
