//
//  subPage.swift
//  SomeBank
//
//  Created by PEPPA CHAN on 01.06.2024.
//

import SwiftUI

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
        .font(.largeTitle)
        .foregroundColor(.white)
    }
}
