//
//  TuesdayUIDesignViewModel3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 22/10/2024.
//

import Foundation
import SwiftUI

class TuesdayUIDesignViewModel3: ObservableObject {
    
    @Published var dataList: [TuesdayUIDesignDataModel3] = [
        
        TuesdayUIDesignDataModel3(imageA: "Image1", imageB: "Image2"),
        TuesdayUIDesignDataModel3(imageA: "Image3", imageB: "Image4")
    ]
    
    
}
