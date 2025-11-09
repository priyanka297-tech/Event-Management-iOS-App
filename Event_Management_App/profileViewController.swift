//
//  profileViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 08/11/24.
//

import UIKit

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func logout(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "signinViewController") as! signinViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
