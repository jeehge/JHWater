//
//  SettingView.swift
//  JHWater
//
//  Created by JH on 2023/06/25.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
	
    var body: some View {
		List {
			SettingItemRow(info: SettingMenuInfo(name: "하루 목표 변경"))
		}
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
		SettingView()
    }
}
