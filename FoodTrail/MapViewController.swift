//
//  MapViewController.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 19/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView:MKMapView!
    var item:Item!
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self;
        
        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(item.location, completionHandler: {(placemarks, error) in
            
            if error != nil {
                print("Geocode failed")
                return
            }
            
            if placemarks != nil && (placemarks?.count)! > 0 {
                let placemark = placemarks?[0]
                // Add Annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.item.name
                annotation.subtitle = self.item.type
                annotation.coordinate = (placemark?.location?.coordinate)!
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        })
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "MyPin"
        
        if annotation is MKUserLocation {
            return nil
        }
        
        // Reuse the annotation if possible
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            }

            let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
            leftIconView.image = UIImage(named: item.image)
            annotationView?.leftCalloutAccessoryView = leftIconView
        
            return annotationView
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
