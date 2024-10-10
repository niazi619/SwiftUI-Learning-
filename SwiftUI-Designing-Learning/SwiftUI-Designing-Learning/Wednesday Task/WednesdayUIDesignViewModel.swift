//
//  WednesdayUIDesignViewModel.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 10/10/2024.
//

import Foundation
import SwiftUI

class WednesdayUIDesignViewModel: ObservableObject {
    
    @Published var carsDataList: [String] = [
        "card1","card2","card3","card4"
    ]
    
    func deleteItem(at index: Int) {
        carsDataList.remove(at: index)
        }
    
}
