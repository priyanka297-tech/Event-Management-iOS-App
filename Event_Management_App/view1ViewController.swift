//
//  ViewViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 06/11/24.
//

import UIKit

class viewViewController: UIViewController {
    private let logoimg: UIImageView = {
        let logoimg = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        logoimg.image = UIImage(named: "eventlogo")
        return logoimg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoimg)
        view.backgroundColor = UIColor(named: "#7B8AA6")// Add logo image to the view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoimg.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animatelogo()
        }
    }
    
    private func animatelogo() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.5
            let newX = size - self.view.frame.size.width
            let newY = self.view.frame.size.height - size
            self.logoimg.frame = CGRect(x: -(newX / 2), y: newY / 2, width: size, height: size)
        })
        
        UIView.animate(withDuration: 1.5, animations: {
                    self.logoimg.alpha = 0
                }, completion: { done in
                    if done {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            // Embed `ViewController` in a navigation controller
                            if let viewController = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController {
                                let navigationController = UINavigationController(rootViewController: viewController)
                                navigationController.modalTransitionStyle = .crossDissolve
                                navigationController.modalPresentationStyle = .fullScreen
                                self.present(navigationController, animated: true)
                            }
                        }
                    }
                })
    }
}
