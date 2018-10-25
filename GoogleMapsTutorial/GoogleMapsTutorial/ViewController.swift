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
        
        googleMapsView.settings.myLocationButton = true
        
        //drawPolyline()
        
        //drawPolygon()
        
        drawCircle()
        
    }

    func showMarker(position: CLLocationCoordinate2D) {
        marker = GMSMarker(position: position)
        marker.title = "Palo Alto"
        marker.snippet = "San Franciseo"
        marker.map = googleMapsView
        
        marker.isDraggable = true
        
        //marker.icon = UIImage(named: "pin")
        
        let customMarkerView = UIView(frame: CGRect.init(x: 0, y: 0, width: 220, height: 80))
        customMarkerView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        customMarkerView.layer.cornerRadius = 5
        customMarkerView.layer.borderColor = UIColor.red.cgColor
        customMarkerView.layer.borderWidth = 1
        
        let firstLabel = UILabel(frame: CGRect.init(x: 8, y: 8, width: customMarkerView.frame.size.width - 16, height: 15))
        firstLabel.text = "Hey!"
        firstLabel.textColor = UIColor.white
        customMarkerView.addSubview(firstLabel)
        
        let secondLabel = UILabel(frame: CGRect.init(x: firstLabel.frame.origin.x, y: firstLabel.frame.size.height + firstLabel.frame.origin.y + 3, width: firstLabel.frame.size.width, height: firstLabel.frame.size.height))
        secondLabel.text = "I'm a custom marker view!"
        secondLabel.textColor = UIColor.white
        customMarkerView.addSubview(secondLabel)
        
        marker.iconView = customMarkerView
    }
    
    // MARK - Draw a Polyline Shape.
    func drawPolyline() {
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
        rectangle.strokeWidth = 2
        rectangle.strokeColor = .black
        
        //googleMapsView.clear()
    }
    
    func drawPolygon() {
        // Create a rectangular path.
        let rectangular = GMSMutablePath()
        rectangular.addLatitude(37.36, longitude: -122.0)
        rectangular.addLatitude(37.45, longitude: -122.0)
        rectangular.addLatitude(37.45, longitude: -122.2)
        rectangular.addLatitude(37.36, longitude: -122.2)
        
        
        // Create the polygon, and assign it to the map.
        let polygon = GMSPolygon(path: rectangular)
        polygon.fillColor = UIColor(red: 0.25, green: 0.0, blue: 0.0, alpha: 0.2)
        polygon.strokeColor = UIColor.black
        polygon.strokeWidth = 2
        polygon.map = googleMapsView
    }
    
    func drawCircle() {
        let circleCenter = CLLocationCoordinate2D(latitude: 37.35, longitude: -122.0)
        let circle = GMSCircle(position: circleCenter, radius: 100000)
        circle.map = googleMapsView
        circle.fillColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.2)
        circle.strokeColor = UIColor.red
    }
    
    @IBAction func zoomInButtonPressed(_ sender: Any) {
        let currentZoom = googleMapsView.camera.zoom
        googleMapsView.animate(toZoom: currentZoom + 0.3)
    }
    
    @IBAction func zoomOutButtonPressed(_ sender: Any) {
        let currentZoom = googleMapsView.camera.zoom
        googleMapsView.animate(toZoom: currentZoom - 0.3)
    }
    
    @IBAction func toggleGesturesButtonPressed(_ sender: Any) {
        if checkMapViewGesturesAvailabilty() {
            googleMapsView.settings.tiltGestures = false
            googleMapsView.settings.zoomGestures = false
            googleMapsView.settings.rotateGestures = false
            googleMapsView.settings.scrollGestures = false
        } else {
            googleMapsView.settings.tiltGestures = true
            googleMapsView.settings.zoomGestures = true
            googleMapsView.settings.rotateGestures = true
            googleMapsView.settings.scrollGestures = true
        }
    }
    
    func checkMapViewGesturesAvailabilty() -> Bool {
        if googleMapsView.settings.tiltGestures && googleMapsView.settings.zoomGestures && googleMapsView.settings.rotateGestures && googleMapsView.settings.scrollGestures {
            return true
        } else {
            return false
        }
    }
}

