//
//  ContentView.swift
//  JHWater
//
//  Created by JH on 2023/06/24.
//

import SwiftUI
import WidgetKit

struct MainView: View {
	@StateObject private var viewModel = WaterViewModel()
	
    @State private var isMinPresented: Bool = false
    @State private var isMaxPresented: Bool = false

    var body: some View {
        VStack {
            HeaderView()

            Spacer()

            ZStack {
                VStack(spacing: 1) {
					ForEach((0 ..< viewModel.totalCount).reversed(), id: \.self) { index in
						if index < viewModel.drinkCount {
                            Rectangle()
                                .fill(Color.teal)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                        }
                    }
                }
                .border(Color("borderColor"), width: 3)
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2.5)
            }

            HStack {
                Button {
                    guard viewModel.drinkCount > 0 else {
                        isMinPresented = true
                        return
                    }

					viewModel.drinkCount -= 1
                    UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
                        UserDefaults.shared.set(value, forKey: key)
                    }
                    UserDefaults.shared.set(viewModel.drinkCount, forKey: "drinkCount")

                    WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .frame(width: 44, height: 44)
                }
                .alert(isPresented: $isMinPresented, content: {
                    Alert(title: Text(""), message: Text("한 잔 이상은 마셔야죠 😨"))
                })

                Text("\(viewModel.drinkCount) 잔")
                    .font(.largeTitle)

                Button {
					guard viewModel.drinkCount < viewModel.totalCount else {
                        isMaxPresented = true
                        return
                    }

					viewModel.drinkCount += 1
                    UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
                        UserDefaults.shared.set(value, forKey: key)
                    }
                    UserDefaults.shared.set(viewModel.drinkCount, forKey: "drinkCount")
                    WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .frame(width: 44, height: 44)
                }
                .alert(isPresented: $isMaxPresented, content: {
                    Alert(title: Text(""), message: Text("오늘 목표 물을 다 마셨습니다 🥳"))
                })
            }

            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
