//
//  MainView.swift
//  JHWater
//
//  Created by JH on 2023/06/24.
//

import SwiftUI
import WidgetKit

struct MainView: View {
    @State private var count = UserDefaults.shared.integer(forKey: "drinkCount")
    @State private var isPresented: Bool = false

    var body: some View {
        VStack {
            HeaderView()
            Spacer()

            ZStack {
                VStack(spacing: 1) {
                    ForEach((0 ..< 8).reversed(), id: \.self) { index in
                        if index <= count {
                            Rectangle()
                                .fill(Color.teal)
                        } else {
                            Rectangle()
                                .fill(Color.white)
                        }
                    }
                }
                .border(Color.black, width: 3)
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2.5)
            }

            Text("\(count)잔")
                .font(.largeTitle)
            Button(action: {
                guard count < 8 else {
                    isPresented = true
                    return
                }

                count += 1

                UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
                    UserDefaults.shared.set(value, forKey: key)
                }
                UserDefaults.shared.set(count, forKey: "drinkCount")
                WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
            }) {
                Text("마시기")
                    .padding()
					.background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }
            .alert(isPresented: $isPresented, content: {
                Alert(title: Text(""), message: Text("오늘 목표 물을 다 마셨습니다 :)"))
            })
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
