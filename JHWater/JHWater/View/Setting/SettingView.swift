//
//  SettingView.swift
//  JHWater
//
//  Created by JH on 2023/06/28.
//

import SwiftUI

struct SettingView: View {

	var body: some View {
		List {
			SettingItemRow(info: SettingMenuInfo(name: "하루 목표"))
			SettingItemRow(info: SettingMenuInfo(name: "하루 목표"))
		}
	}
}

struct SettingView_Previews: PreviewProvider {
	static var previews: some View {
		SettingView()
	}
}
