//
//  Location.swift
//  aSPA
//
//  Created by dmdm on 01/12/2021.
//

import UIKit
import MapKit

class LocationVC : UIViewController {
//    Spa location to enable the customer to know the place
    @IBOutlet weak var mapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnnotation()
        view.backgroundColor = UIColor(named: "bgColor")
        
        let initialLoc = CLLocation(latitude: 24.693719, longitude: 46.723596)
        
        setStartingLocation(location: initialLoc, distance: 1000)
        
    }
    func setStartingLocation(location: CLLocation, distance: CLLocationDistance){
        
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance , longitudinalMeters: distance)
        mapview.setRegion(region, animated: true)
        mapview.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
    }
    func addAnnotation(){
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 24.693719, longitude: 46.723596)
        pin.title = "A Spa"
        mapview.addAnnotation(pin)
    }
}
