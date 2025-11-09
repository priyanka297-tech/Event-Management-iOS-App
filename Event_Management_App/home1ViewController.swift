//
//  home1ViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 22/10/24.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class home1ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate{
    
    
    //    var opts = ["Name","Phone No","Email","Password","Address","Help & Support","About"]
    
    var myopts = 0
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    let images = ["3","62","63","18","42","66","34","68","69","70","71","72","73","74","pandit"]
    let cat = ["Venu","Photographer","Makeup","Prewedding Shoot","Planning Decoration","Invites & Gifts","Music & Dance","Food","Pandit"]
    var myindex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return cat.count
        }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! home1CollectionViewCell
        cell.image?.image = UIImage(named:images[(indexPath as NSIndexPath).row])
        cell.label?.text = cat[indexPath.row]
        return cell
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myindex = indexPath.row
            
            if(myindex == 0)
            {
                let vc = self.storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
                //                vc.img = images[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if(myindex == 1)
            {
                let vc = self.storyboard?.instantiateViewController(identifier: "cat4ViewController") as! cat4ViewController
                //                vc.img = images[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if(myindex == 2)
            {
                let vc = self.storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
                //                vc.img = images[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if(myindex == 3)
            {
                let vc = self.storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
                //                vc.img = images[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if(myindex == 4)
            {
                let vc = self.storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
                //                vc.img = images[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            }
        if(myindex == 5)
        {
            let vc = self.storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
            //                vc.img = images[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(myindex == 6)
        {
            let vc = self.storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
            //                vc.img = images[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(myindex == 7)
        {
            let vc = self.storyboard?.instantiateViewController(identifier: "cat1ViewController") as! cat1ViewController
            //                vc.img = images[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Profile"
    }
    func collectionView(_ collectionView: UICollectionView,layout colectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize{
        let padding: CGFloat = 10  // Padding between cells
        let collectionViewWidth = collectionView.frame.width
        
        // Adjust the cell size for two columns
        let cellWidth = (collectionViewWidth - padding) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}
