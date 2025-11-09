//
//  menuViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 21/10/24.
//

import UIKit

class menuViewController: UIViewController ,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
    
    var menu = ["Wedding","Birthday", "Seminars","Bussiness Events","party","concerts","social Gathring","Anniversary","Resort"]
    //    var menuIcons = ["homeKit", "checklist", "person", "dollarsign", "person", "checklist", "person"]
    var menuIcons = ["44","61","83","94","14","102","83","17","50","3"]
    
    var myopts = 0
    var myindex = 0
    
    @IBOutlet weak var table: UITableView!
    
    
    //    var name = " "
    //    var email = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        //        userName.text = name
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell")
           cell?.textLabel?.text = menu[indexPath.row]
           let iconName = menuIcons[indexPath.row]
           cell?.imageView?.image = UIImage(named: iconName)
           cell?.imageView?.contentMode = .scaleAspectFill
           cell?.imageView?.frame.size = CGSize(width: 40, height: 40)

           // Add padding view with default values for width and height
           let paddingView = UIView(frame: CGRect(
               x: 0,
               y: 5,
               width: (cell?.contentView.frame.width ?? 100) - 10, // Default width of 100 if nil
               height: (cell?.contentView.frame.height ?? 100) - 10 // Default height of 100 if nil
           ))
           paddingView.backgroundColor = .white
           paddingView.layer.cornerRadius = 8
           paddingView.layer.masksToBounds = true
           paddingView.layer.borderWidth = 1
           paddingView.layer.borderColor = UIColor.lightGray.cgColor

           // Set paddingView as the background for cell's contentView
           cell?.contentView.insertSubview(paddingView, at: 0)
           cell?.contentView.layer.masksToBounds = false
           cell?.backgroundColor = .clear // Make cell transparent to show padding

           return cell!
            }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 100 // Set row height
            }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myindex = indexPath.row
        
        if myindex == 0 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat7ViewController") as! cat7ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if myindex == 1 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat6ViewController") as! cat6ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if myindex == 2 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat5ViewController") as! cat5ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if myindex == 3 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat4ViewController") as! cat4ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if myindex == 4 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat3ViewController") as! cat3ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if myindex == 5 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat3ViewController") as! cat3ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if myindex == 6 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat3ViewController") as! cat3ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if myindex == 7 {  // Ensure index does not go out of bounds
            let vc = storyboard?.instantiateViewController(identifier: "cat3ViewController") as! cat3ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let vc = storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
        
    }
