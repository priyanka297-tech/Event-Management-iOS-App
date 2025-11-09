//
//  ViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 14/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "signinViewController") as! signinViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

