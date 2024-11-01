//
//  FridayUIDesignDataModel4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 01/11/2024.
//

import Foundation
import MapKit

struct FridayUIDesignDataModel4: Identifiable {
    
    var id: String = UUID().uuidString
    
}

struct LandmarkDataModel: Identifiable {
    
    var id: String = UUID().uuidString
    var no: Int
    var name: String
    var coordinate: CLLocationCoordinate2D
    var pinImage: String
    var locationImage: String
    var located: String
    
}
