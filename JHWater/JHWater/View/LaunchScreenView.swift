//
//  LaunchScreenView.swift
//  JHWater
//
//  Created by JH on 2023/06/24.
//

import SwiftUI

struct LaunchScreenView: View {
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
			UserDefaults.shared.set(8, forKey: "totalCount")
            navigated = true
        }
        .fullScreenCover(isPresented: $navigated) {
            MainView()
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
