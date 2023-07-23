//
//  WaterViewModel.swift
//  JHWater
//
//  Created by JH on 2023/07/23.
//

import Combine
import SwiftUI

public class WaterViewModel: ObservableObject {
	@Published var drinkCount: Int = UserDefaults.shared.integer(forKey: "drinkCount")
	@Published var totalCount: Int = UserDefaults.shared.integer(forKey: "totalCount")
}
