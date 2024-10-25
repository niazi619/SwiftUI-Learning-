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
        
        "baseBallImage1","baseBallImage2","baseBallImage3","baseBallImage4","baseBallImage5"
        
    ]
    
    @Published var imagesDataList2: [String] = [
        
        "baseBallImage6","baseBallImage7","baseBallImage8","baseBallImage9","baseBallImage10"
        
    ]
    
}
