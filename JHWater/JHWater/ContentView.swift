//
//  ContentView.swift
//  JHWater
//
//  Created by JH on 2023/06/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
	@State private var count = UserDefaults.shared.integer(forKey: "drinkCount")
	@State private var isPresented: Bool = false
	
	var body: some View {
		VStack {
			Image("waterbottle")
				.resizable()
				.frame(
					width: 200,
					height: 200,
					alignment: .center
				)
			Text("\(count)잔")
				.font(.largeTitle)
			Button(action: {
				guard count < 8 else {
					isPresented = true
					return
				}
				
				count += 1
				UserDefaults.standard.dictionaryRepresentation().forEach { (key, value) in
					UserDefaults.shared.set(value, forKey: key)
				}
				UserDefaults.shared.set(count, forKey: "drinkCount")
				WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
			}) {
				Text("마시기")
					.padding()
					.background(Color.blue)
					.foregroundColor(.white)
					.cornerRadius(10)
			}
			.alert(isPresented: $isPresented, content: {
				Alert(title: Text(""), message: Text("지금은 8잔까지만 설정 가능합니다 ㅜㅜ"))}
			)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
