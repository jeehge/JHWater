//
//  FadeInOutView.swift
//  JHWater
//
//  Created by JH on 2023/06/27.
//

import SwiftUI

struct FadeInOut: View {
	var body: some View {
		VStack {
			Text("Fade In and Out")
				.fontWeight(.heavy)
				.padding()

			FadeInOutView(text: "Fade In and Out", startTime: 0.1).padding()

			FadeInOutView(text: "test", startTime: 1.0).padding()
		}
	}
}

struct FadeInOutView: View {
	@State var characters: Array<String.Element>
	@State var opacity: Double = 0
	@State var baseTime: Double

	init(text: String, startTime: Double) {
		characters = Array(text)
		baseTime = startTime
	}

	var body: some View {
		HStack(spacing: 0) {
			ForEach(0 ..< characters.count) { num in
				Text(String(self.characters[num]))
					.font(.title)
					.opacity(opacity)
					.animation(.easeInOut.delay(Double(num) * 0.05),
							   value: opacity)
			}
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + baseTime) {
				opacity = 1
			}
		}
		.onTapGesture {
			opacity = 0
			DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
				opacity = 1
			}
		}
	}
}

struct FadeInOut_Previews: PreviewProvider {
	static var previews: some View {
		FadeInOut()
	}
}
