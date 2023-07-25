//
//  DefaultRow.swift
//  JHWater
//
//  Created by JH on 2023/06/29.
//

import SwiftUI

struct DefaultRow: View {
	var title: String
	
    var body: some View {
		HStack{
			Text("\(title)")
			Spacer()
		}
    }
}

struct DefaultRow_Previews: PreviewProvider {
    static var previews: some View {
		DefaultRow(title: "개발자 정보")
    }
}
