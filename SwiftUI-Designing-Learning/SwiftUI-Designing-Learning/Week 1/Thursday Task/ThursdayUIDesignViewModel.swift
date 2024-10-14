//
//  ThursdayUIDesignViewModel.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 11/10/2024.
//

import Foundation
import SwiftUI

class ThursdayUIDesignViewModel: ObservableObject {
    
    @Published var textDataList: [ThursdayUIDesignDataModel] = [
        ThursdayUIDesignDataModel(titleText1: "Live" ,titleText2: "Learn" ,titleText3: "Remember" , text1: "Reflect more. Be mindful. Focus better." , text2: "Guided journalling for everyone." , text3: "" , text4: "" ,color: Color.white),
        ThursdayUIDesignDataModel(titleText1: "Four" ,titleText2: "Questions" ,titleText3: "Daily" , text1: "What did you learn?" , text2: "What did you achieve?" , text3: "What were your good experiences?       " , text4: "What can I improve?",color: Color.blue),
        ThursdayUIDesignDataModel(titleText1: "Answers" ,titleText2: "Build" ,titleText3: "Knowledge" , text1: "Remember what you learnt." , text2: "Be proud of what you achieve." , text3: "Reminisce in positive memories." , text4: "Identify what you can impove upon.",color: Color.white)
    ]
    
    @Published var textDataList1: [ThursdayUIDesignDataModel] = [
        ThursdayUIDesignDataModel(titleText1: "Live" ,titleText2: "Learn" ,titleText3: "Remember" , text1: "Reflect more. Be mindful. Focus better." , text2: "Guided journalling for everyone." , text3: "" , text4: "" ,color: Color.white)
    ]
    
    @Published var textDataList2: [ThursdayUIDesignDataModel] = [
        ThursdayUIDesignDataModel(titleText1: "Four" ,titleText2: "Questions" ,titleText3: "Daily" , text1: "What did you learn?" , text2: "What did you achieve?" , text3: "What were your good experiences?       " , text4: "What can I improve?",color: Color.blue)
    ]
    
    @Published var textDataList3: [ThursdayUIDesignDataModel] = [
        ThursdayUIDesignDataModel(titleText1: "Answers" ,titleText2: "Build" ,titleText3: "Knowledge" , text1: "Remember what you learnt." , text2: "Be proud of what you achieve." , text3: "Reminisce in positive memories." , text4: "Identify what you can impove upon.",color: Color.white)
    ]
    
    
    
}
