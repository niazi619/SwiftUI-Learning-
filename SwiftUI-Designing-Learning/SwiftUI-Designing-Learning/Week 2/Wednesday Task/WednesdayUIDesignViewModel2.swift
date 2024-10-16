//
//  WednesdayUIDesignViewModel2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 16/10/2024.
//

import Foundation
import SwiftUI

class WednesdayUIDesignViewModel2: ObservableObject {
    
    @Published var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Published var tatooStylesDataList: [WednesdayUIDesignDataModel2] = [
        WednesdayUIDesignDataModel2(idNo: 0, backgroundView: AnyView(Color.gray), tatooImage: "tatooImage1", tatooStyle: "Black & Gray"),
        WednesdayUIDesignDataModel2(idNo: 1, backgroundView: AnyView(Color.white), tatooImage: "tatooImage2", tatooStyle: "Japanese"),
        WednesdayUIDesignDataModel2(idNo: 2, backgroundView: AnyView(Color.white), tatooImage: "tatooImage3", tatooStyle: "Fine Line"),
        WednesdayUIDesignDataModel2(idNo: 3, backgroundView: AnyView(Color.gray), tatooImage: "tatooImage4", tatooStyle: "Old School"),
        WednesdayUIDesignDataModel2(idNo: 4, backgroundView: AnyView(Color.gray), tatooImage: "tatooImage5", tatooStyle: "Hyperreal"),
        WednesdayUIDesignDataModel2(idNo: 5, backgroundView: AnyView(Color.white), tatooImage: "tatooImage6", tatooStyle: "Micro"),
        WednesdayUIDesignDataModel2(idNo: 6, backgroundView: AnyView(Color.white), tatooImage: "tatooImage7", tatooStyle: "Tribal"),
        WednesdayUIDesignDataModel2(idNo: 7, backgroundView: AnyView(Color.white), tatooImage: "tatooImage8", tatooStyle: "Sketch"),
        WednesdayUIDesignDataModel2(idNo: 8, backgroundView: AnyView(Color.white), tatooImage: "tatooImage9", tatooStyle: "Geometric"),
        WednesdayUIDesignDataModel2(idNo: 9, backgroundView: AnyView(Color.white), tatooImage: "tatooImage10", tatooStyle: "Watercolor")
    ]
    
    @Published var tatooImagesDataList: [WednesdayUIDesignDataModel2] = [
        WednesdayUIDesignDataModel2(idNo: 0, backgroundView: AnyView(Color.white), tatooImage: "tatoo1", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 1, backgroundView: AnyView(Color.white), tatooImage: "tatoo2", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 2, backgroundView: AnyView(Color.white), tatooImage: "tatoo3", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 3, backgroundView: AnyView(Color.white), tatooImage: "tatoo4", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 4, backgroundView: AnyView(Color.white), tatooImage: "tatoo5", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 5, backgroundView: AnyView(Color.gray), tatooImage: "tatoo6", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 6, backgroundView: AnyView(Color.white), tatooImage: "tatoo7", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 7, backgroundView: AnyView(Color.white), tatooImage: "tatoo8", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 8, backgroundView: AnyView(Color.white), tatooImage: "tatoo9", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 9, backgroundView: AnyView(Color.gray), tatooImage: "tatoo10", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 10, backgroundView: AnyView(Color.white), tatooImage: "tatoo11", tatooStyle: nil),
        WednesdayUIDesignDataModel2(idNo: 11, backgroundView: AnyView(Color.white), tatooImage: "tatoo12", tatooStyle: nil)
    ]
    
    
}
