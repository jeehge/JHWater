//
//  UserDefaults+Extension.swift
//  JHWater
//
//  Created by JH on 2023/06/24.
//

import SwiftUI

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.com.jeehge.water.info"
        return UserDefaults(suiteName: appGroupId)!
    }
}
