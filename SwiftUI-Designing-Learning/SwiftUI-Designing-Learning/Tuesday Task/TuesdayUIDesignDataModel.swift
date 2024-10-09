//
//  TuesdayUIDesignDataModel.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 08/10/2024.
//

import Foundation

struct TuesdayUIDesignDataModel: Identifiable ,Hashable{
    
    var id: String = UUID().uuidString
    var Text: String?
    var isChecked: Bool = false
}
