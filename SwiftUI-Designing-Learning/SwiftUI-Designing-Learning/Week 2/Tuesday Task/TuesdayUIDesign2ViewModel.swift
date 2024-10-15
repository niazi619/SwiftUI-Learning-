//
//  TuesdayUIDesign2ViewModel.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 15/10/2024.
//

import Foundation
import SwiftUI
import PhotosUI

class TuesdayUIDesign2ViewModel: ObservableObject {
    
    @Published var selectedImage: UIImage? = nil
    @Published var selections: PhotosPickerItem? = nil {
        didSet{
            imageConvertIntoUIImage(from: selections!)
        }
    }
    
    private func imageConvertIntoUIImage(from selection: PhotosPickerItem) {
        Task{
            if let data = try await selection.loadTransferable(type: Data.self){
                if let uIImage = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.selectedImage = uIImage
                    }
                }
            }
        }
    }
    
    
    /*
     private func imageConvert(from Selection: PhotosPickerItem){
         Task{
             if let data = try await Selection.loadTransferable(type: Data.self){
                 if let UiImage = UIImage(data: data){
                     DispatchQueue.main.async {
                         self.selectedImage = UiImage
                     }
                     
                 }
             }
         }
     }
     */
}
