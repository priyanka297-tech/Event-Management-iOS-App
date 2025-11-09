//
//  forgetPasswordViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 14/10/24.
//

import UIKit

class forgetPasswordViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var emailbtn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "recoveryViewController") as! recoveryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
