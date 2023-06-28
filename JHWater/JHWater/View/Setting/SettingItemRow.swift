//
//  SettingItemRow.swift
//  JHWater
//
//  Created by JH on 2023/06/25.
//

import SwiftUI
import WidgetKit

struct SettingMenuInfo: Hashable, Identifiable {
	let id = UUID()
	var name: String
}

struct SettingItemRow: View {
	var info: SettingMenuInfo
	@State private var totalCount = UserDefaults.shared.integer(forKey: "totalCount")

	var body: some View {
		HStack {
			Text(info.name).font(.system(size: 16))
			
			Spacer()
			
			HStack {
				Button {
					totalCount -= 1

					UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
						UserDefaults.shared.set(value, forKey: key)
					}
					UserDefaults.shared.set(totalCount, forKey: "totalCount")
					
					print(totalCount)
					WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
				} label: {
					Image(systemName: "minus.circle.fill")
						.foregroundColor(.black)
						.frame(width: 44, height: 44)
				}
				Text("\(totalCount)")
				Button {
					totalCount += 1

					UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
						UserDefaults.shared.set(value, forKey: key)
					}
					UserDefaults.shared.set(totalCount, forKey: "totalCount")
					WidgetCenter.shared.reloadTimelines(ofKind: "JHWaterWidget")
				} label: {
					Image(systemName: "plus.circle.fill")
						.foregroundColor(.black)
						.frame(width: 44, height: 44)
				}
			}
		}
//		.contentShape(Rectangle())
//		.onTapGesture {
//			if viewModel.selectedMenuList.contains(menu) {
//				viewModel.selectedMenuList.remove(menu)
//			} else {
//				viewModel.selection = menu.name
//				viewModel.selectedMenuList.insert(menu)
//			}
//		}
	}
}

struct SettingItemRow_Previews: PreviewProvider {
	static var previews: some View {
		SettingItemRow(info: SettingMenuInfo(name: "하루 목표"))
	}
}

