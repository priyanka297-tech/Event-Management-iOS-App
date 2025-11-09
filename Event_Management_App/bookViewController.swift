//
//  bookViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 05/11/24.
//

import UIKit

class bookViewController: UIViewController{

    @IBOutlet weak var addview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addview.isHidden = true

      
    }
    

    @IBAction func booknow(_ sender: UIButton) {
        addview.isHidden = false
        
    }
    
    @IBAction func cross(_ sender: UIButton) {
        addview.isHidden = true
        let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
