//
//  HeaderView.swift
//  JHWater
//
//  Created by JH on 2023/06/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button {
            } label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.black)
					.frame(width: 44, height: 44)
			}
			.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
