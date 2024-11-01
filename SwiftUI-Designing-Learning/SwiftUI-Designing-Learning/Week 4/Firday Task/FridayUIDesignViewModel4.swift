//
//  FridayUIDesignViewModel4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 01/11/2024.
//

import Foundation
import SwiftUI
import MapKit

class FridayUIDesignViewModel4: ObservableObject {
    
    @Published var landMarksDataList: [LandmarkDataModel] = [
        
        LandmarkDataModel(no: 1, name: "Golden Gate Bridge", coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783), pinImage: "bridgeMapPin", locationImage: "Golden-Gate-BridgeImage" ,located: "United States"),
        LandmarkDataModel(no: 2, name: "Alcatraz Island", coordinate: CLLocationCoordinate2D(latitude: 37.8267, longitude: -122.4230), pinImage: "AlcatrazIslandMapPin", locationImage: "AlcatrazIslandImage",located: "United States"),
        LandmarkDataModel(no: 3, name: "Coit Tower", coordinate: CLLocationCoordinate2D(latitude: 37.8024, longitude: -122.4058), pinImage: "locationLogo", locationImage: "CoitTowerImage",located: "United States"),
        LandmarkDataModel(no: 4, name: "Fisherman's Wharf", coordinate: CLLocationCoordinate2D(latitude: 37.8080, longitude: -122.4177), pinImage: "Fisherman_sWharfMapPin", locationImage: "Fisherman'sWharfImage",located: "United States")
        
    ]
    
    
}
