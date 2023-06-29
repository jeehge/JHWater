//
//  HeaderView.swift
//  JHWater
//
//  Created by JH on 2023/06/28.
//

import SwiftUI

struct HeaderView: View {
    @State private var showingSheet = false

    var body: some View {
        HStack {
            Spacer()

            Button {
                showingSheet.toggle()
            } label: {
                Image(systemName: "gearshape.fill")
                    .frame(width: 44, height: 44)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            .frame(width: 44, height: 44)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
        .sheet(isPresented: $showingSheet) {
            SettingView()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
	static var previews: some View {
		HeaderView()
	}
}
