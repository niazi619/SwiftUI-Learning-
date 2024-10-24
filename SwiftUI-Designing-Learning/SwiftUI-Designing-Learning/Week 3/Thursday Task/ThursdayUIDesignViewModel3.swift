//
//  ThursdayUIDesignViewModel3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 24/10/2024.
//

import Foundation
import SwiftUI

class ThursdayUIDesignViewModel3: ObservableObject {
    
    @Published var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Published var imagesDataList: [String] = [
        
        "baseBallImage1","baseBallImage2","baseBallImage3"
        
    ]
    
    @Published var imagesDataList2: [String] = [
        
        "baseBallImage4","baseBallImage5","baseBallImage6"
        
    ]
    
}
