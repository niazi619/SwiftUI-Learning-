//
//  TuesdayUIDesignViewModel.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 08/10/2024.
//

import Foundation
import SwiftUI

class TuesdayUIDesignViewModel: ObservableObject {
    
    @Published var dataList: [TuesdayUIDesignDataModel] = [
        TuesdayUIDesignDataModel(Text: "Hawaii Holiday" ),
        TuesdayUIDesignDataModel(Text: "Rosa's Birthday"),
        TuesdayUIDesignDataModel(Text: "Doctor's Appointment")
    ]
    
    
}
