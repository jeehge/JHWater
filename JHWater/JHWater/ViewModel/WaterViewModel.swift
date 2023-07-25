//
//  WaterViewModel.swift
//  JHWater
//
//  Created by JH on 2023/07/23.
//

import Combine
import SwiftUI
import WidgetKit

public class WaterViewModel: ObservableObject {
	@Published var drinkCount: Int = UserDefaults.shared.integer(forKey: "drinkCount")
	@Published var totalCount: Int = UserDefaults.shared.integer(forKey: "totalCount")
	
	func setTotal(count: Int) {
		UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
			UserDefaults.shared.set(value, forKey: key)
		}
		UserDefaults.shared.set(count, forKey: "totalCount")
		WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
	}
	
	func setDrink(count: Int) {
		UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
			UserDefaults.shared.set(value, forKey: key)
		}
		
		if count > totalCount {
			UserDefaults.shared.set(totalCount, forKey: "drinkCount")
		} else {
			UserDefaults.shared.set(count, forKey: "drinkCount")
		}
		
		WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
	}
}
