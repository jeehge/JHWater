//
//  Animation+Extension.swift
//  JHWater
//
//  Created by JH on 2023/06/27.
//

import SwiftUI

extension Animation {
	// ripple: 잔물결
	static func ripple(index: Int) -> Animation {
		Animation.spring(dampingFraction: 0.5) // dampingFraction 튕기는 정도 0 ~ 1
			.speed(2)
			.delay(0.03 * Double(index))
	}
}
