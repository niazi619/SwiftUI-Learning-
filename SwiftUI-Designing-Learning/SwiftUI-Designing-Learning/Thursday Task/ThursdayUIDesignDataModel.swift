//
//  ThursdayUIDesignDataModel.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 11/10/2024.
//

import Foundation
import SwiftUI

struct ThursdayUIDesignDataModel: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var titleText1: String?
    var titleText2: String?
    var titleText3: String?
    var text1: String?
    var text2: String?
    var text3: String?
    var text4: String?
    var color: Color?
}
