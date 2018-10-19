//
//  ViewControllerGoogleMapsDelegate.swift
//  GoogleMapsTutorial
//
//  Created by Ahmed Elbasha on 10/19/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import GoogleMaps
import UIKit

extension ViewController: GMSMapViewDelegate {
    
    // MARK: Info Window View
    
    // handles Info Window tap
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("didTapInfoWindowOf")
    }
    
    // handles Info Window long press
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }
    
    // set a custom Info Window
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let label1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        label1.text = "Hi There!"
        view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect.init(x: label1.frame.origin.x, y: label1.frame.origin.y + label1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        label2.text = "I'm a custom info window"
        label2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(label2)
        
        return view
    }
    
    //MARK - GMSMarker Dragging
    
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging")
    }
}
