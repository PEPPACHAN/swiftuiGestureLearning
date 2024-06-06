//
//  recentlySelection.swift
//  SomeBank
//
//  Created by PEPPA CHAN on 01.06.2024.
//

import SwiftUI

struct recentlySelection: View {
    let cityTopFrameImage = ["fuel", "bankShop", "lentaMarket", "VVMarket"]
    let cityTopFrameNames = ["Топливо", "Bank Shop", "Лента Гипер", "ВкусВилл"]
    let screenSize = UIScreen.main.bounds
    var body: some View {
        HStack {
            Text("Недавние")
                .font(.title2)
                .bold()
                .padding(.leading, 17)
                .padding(.top, 7)
            Spacer()
        }
        HStack{
            ForEach(0..<cityTopFrameImage.count, id: \.self){ index in
                VStack {
                    Image(cityTopFrameImage[index])
                        .resizable()
                        .frame(width: 65, height: 65)
                        .padding(9)
                    Text(cityTopFrameNames[index])
                        .font(.system(size: 13))
                }
            }
        }
        .padding()
        .frame(width: screenSize.width - 10)
        .background(Color(.systemGray6))
        .cornerRadius(25)
    }
}
