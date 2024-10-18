//
//  ThursdayUIDesignView2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 17/10/2024.
//

import SwiftUI

struct ThursdayUIDesignView2: View {
    
    @State var search: String = ""
    
    @ObservedObject var vm = ThursdayUIDesignViewModel2()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                VStack{
                    header
                    searchView
                    
                    ScrollView{
                        VStack(spacing: 40) {
                            
                            dataListView
//                            forYouDataListView
//                            freeTodayDataListView
//                            mostPopularDataListView
                        }
                    }
                    
                }
                
                //  .padding(.horizontal)
                
            }
        }
    }
    
    var header: some View {
        Text("")
            .navigationBarItems(leading: HStack(spacing: 50){
                Button(action: {}, label: {
                    Text("Cancel")
                        .FontForegroundColorModifier(20, .light, .default, nil, nil, .black)
                })
                
                Button(action: {}, label: {
                Text("Categories")
                    .FontForegroundColorModifier(22, .bold, .default, nil, nil, .black)
                })
                
            } , trailing: Button(action: {}, label: {
                Text("Unlock All")
                    .FontForegroundColorModifier(20, .light, .default, nil, nil, .black)
            }))
    }
    
    var searchView: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $search)
        }
        .padding()
        .FontForegroundColorModifier(25, .regular, .default, nil, nil, Color("customDeepGray"))
        .FrameBackgroundColorModifier(350, 50, .gray, 0.25, 10)
        .padding(.bottom,25)

    }
    
    var dataListView: some  View {
        
        ForEach(vm.dataList.indices) { index in
            VStack(alignment: .leading ,spacing: 10){
                
                Text(vm.dataList[index].arrayName)
                    .FontForegroundColorModifier(24, .semibold, .default, nil, nil, .black)
                
                ScrollView(.horizontal) {
                    
                    LazyHGrid(rows: vm.rows ,spacing: 10) {
                        ForEach(vm.dataList[index].arrays) { obj in
                            
                            HStack{
                                
                                VStack{
                                    Text(obj.name)
                                        .FontForegroundColorModifier(17, .light, .default, nil, nil, .black)
                                    
                                    Spacer()
                                }
                                .padding([.top,.leading])
                                
                                Spacer()
                                
                                VStack(spacing: 20) {
                                    Image(systemName: obj.image)
                                        .resizable()
                                        .FontForegroundColorModifier(20, .light, .default, 28, 28, .black)
                                        .padding(obj.lock == true ? .trailing : [.top ,.trailing])
                                    
                                    if obj.lock == true {
                                        Image(systemName: "lock.fill")
                                            .resizable()
                                            .FontForegroundColorModifier(22, .light, .default, 15, 19, .gray)
                                    }else{
                                        Spacer()
                                    }
                                }
                                
                            }
                            .FrameBackgroundColorModifier(170, 85, .gray, 0.25, 10)
                            
                        }
                        
                    }
                    
                }
                .frame(width: 350 ,height: 180)            .scrollIndicators(.hidden)
                
            }
        }
        
    }
    
}

struct ThursdayUIDesignView2_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView2()
    }
}
