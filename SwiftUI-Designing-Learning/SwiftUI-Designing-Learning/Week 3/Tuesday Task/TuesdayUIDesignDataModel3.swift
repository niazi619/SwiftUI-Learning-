//
//  TuesdayUIDesignDataModel3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 22/10/2024.
//

import Foundation

struct TuesdayUIDesignDataModel3: Identifiable {
    
    var id: String = UUID().uuidString
    var imageA: String
    var isCheckedA: Bool = false
    var imageB: String
    var isCheckedB: Bool = false
}
