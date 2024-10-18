//
//  ThursdayUIDesignViewModel2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 17/10/2024.
//

import Foundation
import SwiftUI

class ThursdayUIDesignViewModel2: ObservableObject {
    
    @Published var rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Published var dataList: [ArraysDataModel] = [
        
        ArraysDataModel(arrayName: "For You", arrays: [
            
            ThursdayUIDesignDataModel2(name: "Family", image:"house", lock: true),
            ThursdayUIDesignDataModel2(name: "Love", image:"suit.heart", lock: true),
            ThursdayUIDesignDataModel2(name: "Relationships", image:"hands.clap", lock: true),
            ThursdayUIDesignDataModel2(name: "Missing someone", image:"person.fill.questionmark", lock: true),
            ThursdayUIDesignDataModel2(name: "Fake people", image:"person", lock: true),
            ThursdayUIDesignDataModel2(name: "Honesty", image:"hand.thumbsup", lock: true),
            ThursdayUIDesignDataModel2(name: "Best friend", image:"person.2", lock: true),
            ThursdayUIDesignDataModel2(name: "Falling in love", image:"heart.circle", lock: true)
        ]),
        
        ArraysDataModel(arrayName: "Free Today", arrays: [
            
            ThursdayUIDesignDataModel2(name: "Calm", image:"drop.circle", lock: false),
            ThursdayUIDesignDataModel2(name: "Patience", image:"hand.tap", lock: false),
            ThursdayUIDesignDataModel2(name: "Focus", image:"target", lock: false),
            ThursdayUIDesignDataModel2(name: "Loving kindness", image:"leaf", lock: false),
            ThursdayUIDesignDataModel2(name: "Beauty", image:"circle.dotted", lock: false),
            ThursdayUIDesignDataModel2(name: "Loving kindness", image:"leaf", lock: false),
            ThursdayUIDesignDataModel2(name: "Uncertainty", image:"person.fill.questionmark", lock: false),
            ThursdayUIDesignDataModel2(name: "Heartbroken", image:"bolt.heart", lock: false)
        ]),
        
        ArraysDataModel(arrayName: "Most popular", arrays: [
            
            ThursdayUIDesignDataModel2(name: "Affirmations", image:"checkmark.square", lock: false),
            ThursdayUIDesignDataModel2(name: "Motivation", image:"earbuds", lock: true),
            ThursdayUIDesignDataModel2(name: "Love", image:"suit.heart", lock: true)
        ])
    ]
    
}
