//
//  TuesdayUIDesignViewModel4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 29/10/2024.
//

import Foundation
import SwiftUI

class TuesdayUIDesignViewModel4: ObservableObject {
    
    @Published var dataList: [TuesdayUIDesignDataModel4] = [
        
        TuesdayUIDesignDataModel4(question: "What is your most embarrassing moment?", colorCheck1: true, colorCheck2: true, colorCheck3: true, colorCheck4: true, colorCheck5: true),
        TuesdayUIDesignDataModel4(question: "What is your weight?", colorCheck1: true, colorCheck2: true, colorCheck3: true, colorCheck4: false, colorCheck5: false),
        TuesdayUIDesignDataModel4(question: "How tall are you?", colorCheck1: true, colorCheck2: true, colorCheck3: true, colorCheck4: false, colorCheck5: false),
        TuesdayUIDesignDataModel4(question: "Where do you see yourself in 5 years?", colorCheck1: false, colorCheck2: false, colorCheck3: true, colorCheck4: true, colorCheck5: true)
        
    ]
    
}
