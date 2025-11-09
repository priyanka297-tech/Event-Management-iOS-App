import UIKit
import MapKit
import CoreLocation

class map1ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example coordinates for initial region
        let latitude: Double = 37.7749
        let longitude: Double = -122.4194
        let spanCoordinate: Double = 0.05
        let annotationTitle: String = "San Francisco"
        
        // Set the initial location coordinates
        let locationCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // Set the map span (zoom level)
        let span = MKCoordinateSpan(latitudeDelta: spanCoordinate, longitudeDelta: spanCoordinate)
        
        // Set the region to display on the map
        let region = MKCoordinateRegion(center: locationCoordinates, span: span)
        mapView.setRegion(region, animated: true)
        
        // Create an annotation and add it to the map
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationCoordinates
        annotation.title = annotationTitle
        mapView.addAnnotation(annotation)
        
        // Set the search bar delegate to self
        searchBar.delegate = self
    }

    // MARK: - UISearchBarDelegate Method
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard
        
        // Check if the search bar has text
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        
        // Perform local search
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { [weak self] response, error in
            guard let self = self else { return }
            
            // Handle the search result or error
            if let error = error {
                print("Error searching location: \(error.localizedDescription)")
                return
            }
            
            guard let response = response, let mapItem = response.mapItems.first else {
                print("No results found")
                return
            }
            
            // Get the coordinate of the first result
            let coordinate = mapItem.placemark.coordinate
            
            // Set a new region based on the search result
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            self.mapView.setRegion(region, animated: true)
            
            // Add an annotation for the found location
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = mapItem.name
            self.mapView.removeAnnotations(self.mapView.annotations) // Remove previous annotations
            self.mapView.addAnnotation(annotation)
        }
    }
}

