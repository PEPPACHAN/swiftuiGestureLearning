//
//  swipeNotification.swift
//  SomeBank
//
//  Created by PEPPA CHAN on 01.06.2024.
//

import SwiftUI

struct SwipeNotification: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        VStack{
            HStack{
                Image("fuelEmpty")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                HStack {
                    VStack{
                        Text("Пора заправиться")
                        Text("С кэшбэком до 3%")
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                Text("···")
                    .offset(x: 0, y: -10)
                    .bold()
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
            }
            Text("Вы недавно заправлялись, напоминаем сделать это снова в нашем сервисе Топливо")
        }
        .padding()
        .frame(width: screenSize.width - 10)
        .font(.system(size: 15))
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}
