//
//  ViewController.swift
//  GoogleMapsTutorial
//
//  Created by Ahmed Elbasha on 10/18/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var googleMapsView: GMSMapView!
    
    var marker: GMSMarker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.36, longitude: -122.0, zoom: 6.0)
        googleMapsView.camera = camera
        showMarker(position: camera.target)
        
        drawRectangle()
    }

    func showMarker(position: CLLocationCoordinate2D) {
        marker = GMSMarker(position: position)
        marker.title = "Palo Alto"
        marker.snippet = "San Franciseo"
        marker.map = googleMapsView
        marker.isDraggable = true
    }
    
    // MARK - Draw a Polyline Shape.
    func drawRectangle() {
        // Create the path.
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.2))
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.2))
        path.addLatitude(37.36, longitude: -122.0)
        
        // Show what you have drawn.
        let rectangle = GMSPolyline(path: path)
        rectangle.map = googleMapsView
    }
}

