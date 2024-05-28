//
//  ContentView.swift
//  SomeBank
//
//  Created by PEPPA CHAN on 22.05.2024.
//

import SwiftUI

struct CityPage: View {
    
    @State private var offsetSubPage = CGPoint(x: 0, y: UIScreen.main.bounds.height / 1.5)
    @State private var offsetText: CGPoint = .zero
    let screenSize = UIScreen.main.bounds
    @State private var arr = ["arr", "arr", "arr", "arr", "arr", "arr", "arr", "arr"]
    
    var body: some View {
        ZStack{
            ScrollView(.horizontal){
                HStack {
                    ForEach(arr, id: \.self){
                        Text("\($0)")
                            .padding(20)
                            .font(.largeTitle)
                            .background(Color.green)
                    }
                }
            }
            .padding(23)
            .background(Color(.gray))
            .cornerRadius(10)
            
            SubPage()
                .cornerRadius(30)
                .offset(CGSize(width: offsetSubPage.x, height: offsetSubPage.y))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            offsetSubPage = CGPoint(x: 0, y: value.location.y)
                        })
                        .onEnded({ value in
                            withAnimation {
                                offsetSubPage = value.translation.height < 20 ? CGPoint(x: 0, y: screenSize.height / 8): CGPoint(x: 0, y: screenSize.height / 1.5)
                            }}))
                .onTapGesture {
                    withAnimation{
                        offsetSubPage = CGPoint(x: 0, y: screenSize.height / 8)
                    }}
        }
    }
}

struct SubPage: View {
    
    let screenSize = UIScreen.main.bounds
    @State private var textForSubPage = false
    
    var body: some View {
        VStack{
            Text(textForSubPage ? "You clicked the button": "You unclicked the button")
                .padding(50)
            
            Button(action: {
                textForSubPage.toggle()
            }){
                Text("Press me!")
            }
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(.red))
        .font(.largeTitle)
        .foregroundColor(.white)
    }
    
}

#Preview {
    CityPage()
}
