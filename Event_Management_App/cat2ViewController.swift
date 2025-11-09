//
//  cat2ViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 04/11/24.

import UIKit

class cat2ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var img1 = " "

    @IBOutlet weak var hotel: UILabel!
    var hotels = " "
    
    @IBOutlet weak var rating: UILabel!
    var ratings = " "
    
    @IBOutlet weak var describe: UILabel!
    var descript = " "
    
    override func viewDidLoad() {
            super.viewDidLoad()
            img.image = UIImage(named: img1)
            hotel.text = hotels
            rating.text = ratings
            describe.text = descript
        
// we use uiimage as img is image and img1 is in string that is why use uiimage to convert the strin into image

    }
    
    @IBAction func booknow(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "bookViewController") as! bookViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func map(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "map1ViewController") as! map1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
