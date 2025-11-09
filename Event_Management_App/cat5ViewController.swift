//
//  cat5ViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 04/11/24.
//

import UIKit

class cat5ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate {

    @IBOutlet weak var collection: UICollectionView!
    
    let images = ["81","82","83","84","85","86","87","88","89","80","90","91",]
    let cat = ["Taj Mahal Palace",
               "The Oberoi Amarvilas",
               "The Leela Palace",
               "ITC Grand Chola",
               "The Ritz-Carlton",
               "Umaid Bhawan Palace",
               "The Taj Lake Palace",
               "Ananda in the Himalayas",
               "The Oberoi Udaivilas",
               "The Leela Kovalam"]
    let Hotels = ["Taj Mahal Palace – Mumbai",
                  "The Oberoi Amarvilas – Agra",
                  "The Leela Palace – New Delhi",
                  "ITC Grand Chola – Chennai",
                  "The Ritz-Carlton – Bangalore",
                  "Umaid Bhawan Palace – Jodhpur",
                  "The Taj Lake Palace – Udaipur",
                  "Ananda in the Himalayas – Rishikesh",
                  "The Oberoi Udaivilas – Udaipur",
                  "The Leela Kovalam – Kerala"]
    let Rating = ["4.5/5","4.1/5","4.3/5","3.9/5","4.8/5","4.9/5","4.7/5","4.6/5","4.5/5"]
    let Describe = ["This iconic luxury hotel is a landmark in Mumbai, overlooking the Gateway of India and the Arabian Sea. Opened in 1903, it combines classic elegance with modern amenities, featuring world-class dining, opulent decor, and exceptional service, making it a favorite for royalty, dignitaries, and celebrities.","Located just 600 meters from the Taj Mahal, this luxurious resort offers unparalleled views of the monument from every room. Designed with Mughal-inspired architecture, it features lavish interiors, beautiful courtyards, and gardens, providing a magical experience to guests visiting Agra.","Known for its regal architecture and artistic design inspired by Lutyens' Delhi, The Leela Palace blends Indian royalty with contemporary luxury. Located in the diplomatic enclave, it offers gourmet dining, a rooftop pool, and a spa, making it a prime choice for a luxurious stay in the capital.","A grand tribute to the Chola dynasty, this palatial hotel in Chennai showcases South Indian heritage with stunning architecture, luxurious suites, and exceptional service. It boasts multiple award-winning restaurants, extensive event spaces, and a focus on sustainable luxury.","Situated in the heart of Bangalore, this luxury hotel offers a blend of elegance and modern sophistication. With its beautifully designed rooms, rooftop bar, world-class spa, and fine dining options, it provides a serene oasis within the bustling city.","This majestic palace is one of the world’s largest private residences, offering guests a royal experience. With Art Deco and Rajasthani-inspired decor, expansive gardens, and views of Jodhpur’s desert landscape, Umaid Bhawan immerses guests in Rajasthan's rich heritage and opulence.","Situated on Lake Pichola, this floating palace is one of India’s most romantic hotels. Built in 1746, the palace offers a regal experience with exquisite architecture, traditional Rajasthani interiors, and breathtaking views of Udaipur’s lakes and palaces.","This renowned wellness retreat in the Himalayan foothills offers a transformative experience focused on health and relaxation. With yoga, meditation, Ayurvedic treatments, and stunning views of the Ganges valley, Ananda provides a sanctuary for spiritual rejuvenation.","A palace-inspired resort on the banks of Lake Pichola, Udaivilas showcases traditional Mewar architecture with its courtyards, fountains, and domes. It’s known for its luxurious rooms, sprawling gardens, and picturesque lake views, capturing the romance of Udaipur."," Set on a cliff overlooking the Arabian Sea, The Leela Kovalam is one of Kerala's most scenic beach resorts. It combines coastal charm with luxury, featuring a private beach, infinity pools, and authentic Kerala Ayurvedic treatments for a rejuvenating tropical escape."]
    var myindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! cat5CollectionViewCell
        cell.image?.image = UIImage(named:images[(indexPath as NSIndexPath).row])
        cell.label?.text = cat[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myindex = indexPath.row
        
        
        if myindex < Hotels.count, myindex < Rating.count, myindex < Describe.count {
            let vc = self.storyboard?.instantiateViewController(identifier: "cat2ViewController") as! cat2ViewController
            vc.img1 = images[indexPath.row]
            vc.hotels = Hotels[myindex]
            vc.ratings = Rating[myindex]
            vc.descript = Describe[myindex]
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView,layout colectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize{
        let padding: CGFloat = 11  // Padding between cells
        let collectionViewWidth = collectionView.frame.width
        
        // Adjust the cell size for two columns
        let cellWidth = (collectionViewWidth - padding) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
    



}
