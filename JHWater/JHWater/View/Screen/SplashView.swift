//
//  SplashView.swift
//  JHWater
//
//  Created by JH on 2023/06/27.
//

import SwiftUI

struct SplashView: View {
    @State private var navigated: Bool = false

    let moveToTimer = Timer.publish(every: 3.0, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        ZStack {
            LottieView(lottieFile: "83562-water")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            FadeInOutView(text: "지 혜 로 운 수 분 충 전", startTime: 0.45)
                .padding()
                .font(.title)
                .foregroundColor(.white)
        }
        .onReceive(moveToTimer) { _ in
			if UserDefaults.shared.integer(forKey: "totalCount") <= 0 {
				UserDefaults.shared.set(8, forKey: "totalCount")
			}
			
            navigated = true
        }
        .fullScreenCover(isPresented: $navigated) {
            MainView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
		SplashView()
    }
}
