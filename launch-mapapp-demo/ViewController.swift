//
//  ViewController.swift
//  launch-mapapp-demo
//
//  Created by eiji kushida on 2020/02/06.
//  Copyright © 2020 eiji kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let latitude = "35.658581"
    let longitude = "139.745433"
    var urlString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        launchMapApp()
    }
    
    private func launchMapApp() {
        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
            
            //https://developers.google.com/maps/documentation/urls/ios-urlscheme
            //driving : driving / transit / bicycling / walking
            urlString = "comgooglemaps://?daddr=\(latitude),\(longitude)&directionsmode=driving&zoom=14"
        }
        else {
            //https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html
            //dirflg ; d(by car) / w(by foot) / r(by public transit)
            urlString = "http://maps.apple.com/?daddr=\(latitude),\(longitude)&dirflg=d"
        }
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

