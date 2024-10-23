//
//  WednesdayUIDesignViewModel3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 23/10/2024.
//

import Foundation
import SwiftUI

class WednesdayUIDesignViewModel3: ObservableObject {
    
    @Published var dataList: [WednesdayUIDesignDataModel3] = [
        
        WednesdayUIDesignDataModel3(image: "toyStoryImage", movieName: "Toy Story 4", ringPercentage: "76%", date: "Jan 26, 2019", discripation: "Woody has always been confident about his place in the world and that his name is Woody."),
        WednesdayUIDesignDataModel3(image: "darkPhoenixImage", movieName: "Dark Phoenix", ringPercentage: "64%", date: "Jan 5, 2019", discripation: "The X-Men face their most formidable and powerful foe when one of enemy got died."),
        WednesdayUIDesignDataModel3(image: "captainMarvelImage", movieName: "Captain Marvel", ringPercentage: "70%", date: "Jan 6, 2019", discripation: "The story follows Carol and his budy and they fight with their enemy and protect the world form that enemy.")
        
    ]
    
    
}
