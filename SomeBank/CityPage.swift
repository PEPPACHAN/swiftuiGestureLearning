//
//  ContentView.swift
//  SomeBank
//
//  Created by PEPPA CHAN on 22.05.2024.
//

import SwiftUI

struct CityPage: View {

    @State private var offsetSwipeNotification: CGFloat = .zero
    @State private var sheetOpened: Bool = false
    @State private var offsetSubPage: CGFloat = UIScreen.main.bounds.height / 1.3
    
    @AppStorage("selectedCity") private var selectedCity: Int = 0
    
    var body: some View {
        
        let citiesArray = ["Махачкала", "Москва", "Нижний Новгород"]
        let screenSize = UIScreen.main.bounds
        
        ZStack{
            VStack {
                HStack{
                    Button {
                        sheetOpened.toggle()
                    } label: {
                        Text("\(citiesArray[selectedCity])")
                        Image(systemName: "chevron.down")
                    }
                }
                recentlySelection()
                
                SwipeNotification()
                    .offset(x: offsetSwipeNotification, y: 0)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                offsetSwipeNotification += value.translation.width / 50
                            })
                            .onEnded({ value in
                                withAnimation {
                                    offsetSwipeNotification = .zero
                                }
                            })
                    )
            }
            .sheet(isPresented: $sheetOpened, content: {
                ForEach(0..<citiesArray.count, id: \.self){ index in
                    Button {
                        selectedCity = index
                        sheetOpened = false
                    } label: {
                        Text(citiesArray[index])
                            .padding()
                            .frame(width: screenSize.width, alignment: .leading)
                            .foregroundColor(.white)
                    }
                }
            })
            .foregroundColor(.white)
            
            SubPage()
                .frame(width: screenSize.width, height: screenSize.height)
                .background(Color(.red))
                .cornerRadius(30)
                .offset(x: 0, y: offsetSubPage > screenSize.height / 9 ? offsetSubPage: screenSize.height / 8)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            offsetSubPage += value.translation.height / 50
                        })
                        .onEnded({ value in
                            withAnimation {
                                offsetSubPage = value.translation.height < 50 ? screenSize.height / 9: screenSize.height / 1.3
                            }}))
                .onTapGesture {
                    withAnimation(.smooth(duration: 0.5)){
                        offsetSubPage = screenSize.height / 9
                    }}
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}




#Preview {
    CityPage()
}
