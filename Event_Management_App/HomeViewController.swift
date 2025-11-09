//  HomeViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 14/10/24.

import UIKit
import FirebaseCore
import FirebaseDatabase

class HomeViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UITabBarDelegate{
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var collection1: UICollectionView!
    @IBOutlet weak var collection2: UICollectionView!
    @IBOutlet weak var collection3: UICollectionView!
    @IBOutlet weak var collection4: UICollectionView!
    
    let images = ["22","b","c","d","e","f","g","h","5"]
    let imagess = ["36","64","90","82","94","103"]
    let cats = ["Wedding","Birthday", "Seminars","Bussiness Events","party","concerts"]
    let images1 = ["36","94","101","37","65","87","82"]
    let cats1 = ["Anniversary","Party","concerts","Weddings","Birthday","Seminar","Bussiness Events"]
    let images2 = ["90","82","38","94","102","35","65"]
    let cats2 = ["Seminar","Bussiness Events","Anniversary","Party","concerts","Weddings","Birthday"]
    let images3 = ["1","2","3","4","5","6","7","8","9","10"]
    let cats3 = ["Taj Mahal Palace",
                 "The Oberoi Amarvilas",
                 "The Leela Palace",
                 "ITC Grand Chola",
                 "The Ritz-Carlton",
                 "Umaid Bhawan Palace",
                 "The Taj Lake Palace",
                 "Ananda in the Himalayas",
                 "The Oberoi Udaivilas",
                 "The Leela Kovalam"]
    
    var timer: Timer?
    var currentcellIndex = 0
    var myindex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func configureCollectionViews() {
            collection.delegate = self
            collection.dataSource = self
            collection1.delegate = self
            collection1.dataSource = self
            collection2.delegate = self
            collection2.dataSource = self
            collection3.delegate = self
            collection3.dataSource = self
            collection4.delegate = self
            collection4.dataSource = self
        }
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        myPageControl.numberOfPages = images.count
        
    }

    @objc func slideToNext(){
        if currentcellIndex < images.count-1
        {
            currentcellIndex = currentcellIndex + 1
            
        }
        else{
            currentcellIndex = 0
        }
        myPageControl.currentPage = currentcellIndex
        
        collection.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0),at:.right,animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collection){
            return images.count
        }
        else if(collectionView == collection1){
            return imagess.count
        }
        else if(collectionView == collection2){
            return images1.count
        }
        else if(collectionView == collection3){
            return images2.count
        }
        return images3.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
            cell.image?.image = UIImage(named: images[indexPath.row])
            return cell
        }
        
        else if collectionView == collection1 {
            let cell2 = collection1.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! HomeCollectionViewCell2
            cell2.image1?.image = UIImage(named: imagess[indexPath.row])
            cell2.label1?.text = cats[indexPath.row]
            return cell2
        }
        else if collectionView == collection2 {
            let cell3 = collection2.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! HomeCollectionViewCell3
            cell3.image3?.image = UIImage(named: images1[indexPath.row])
            cell3.label3?.text = cats1[indexPath.row]
            return cell3
        }
        else if collectionView == collection3 {
            let cell4 = collection3.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as! HomeCollectionViewCell4
            cell4.image4?.image = UIImage(named: images2[indexPath.row])
            cell4.label4?.text = cats2[indexPath.row]
            return cell4
        }
        else {
            let cell5 = collection4.dequeueReusableCell(withReuseIdentifier: "cell5", for: indexPath) as! HomeCollectionViewCell5
            cell5.image5?.image = UIImage(named: images3[indexPath.row])
            cell5.label5?.text = cats3[indexPath.row]
            return cell5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myindex = indexPath.row
        if collectionView == collection1 {
            if myindex == 1 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat7ViewController") as! cat7ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 2 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat6ViewController") as! cat6ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 3 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat5ViewController") as! cat5ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 0 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat4ViewController") as! cat4ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 4 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat4ViewController") as! cat4ViewController
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
            else{
                let vc = storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
                navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    
        else if collectionView == collection2 {
            
            if myindex == 0 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat7ViewController") as! cat7ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 1 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat6ViewController") as! cat6ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 2 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "recentViewController") as! recentViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 3 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "upcomingViewController") as! upcomingViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 4 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "recentViewController") as! recentViewController
                navigationController?.pushViewController(vc, animated: true)
                
            }
            else if myindex == 5 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "upcomingViewController") as! upcomingViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 6 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "recentViewController") as! recentViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 7 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "upcomingViewController") as! upcomingViewController
                navigationController?.pushViewController(vc, animated: true)
            }
      
            
        }
        else if collectionView == collection3 {
            if myindex == 0 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "recentViewController") as! recentViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 1 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "upcomingViewController") as! upcomingViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 2 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "recentViewController") as! recentViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 3 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "upcomingViewController") as! upcomingViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 4 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "recentViewController") as! recentViewController
                navigationController?.pushViewController(vc, animated: true)
                
            }
            else if myindex == 5 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "upcomingViewController") as! upcomingViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 6 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "recentViewController") as! recentViewController
                navigationController?.pushViewController(vc, animated: true)
            }
            else if myindex == 7 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "upcomingViewController") as! upcomingViewController
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        else if collectionView == collection4 {
            if myindex < 10 {  // Ensure index does not go out of bounds
                let vc = storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
        }

    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Set a fallback size in case collectionView.frame.width is 0
            let fallbackWidth: CGFloat = 100  // Adjust as needed
            let collectionViewWidth = collectionView.frame.width > 0 ? collectionView.frame.width : fallbackWidth
            
            let padding: CGFloat = 10  // Padding between cells
            _ = max((collectionViewWidth - padding) / 2, 0)
//            return CGSize(width: cellWidth, height: cellWidth)
            return CGSize(width: 300, height: 200)
            }
    
    @IBAction func functionBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "profileViewController") as! profileViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func home(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func checklist(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "checkViewController") as! checkViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func guest(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "guestViewController") as! guestViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func vendor(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "home1ViewController") as! home1ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func menu(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "menuViewController") as! menuViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btn1(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "cat7ViewController") as! cat7ViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "cat6ViewController") as! cat6ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
    
