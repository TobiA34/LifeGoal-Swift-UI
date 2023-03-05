//
//  UIText+jhgj.swift
//  LifeGoals
//
//  Created by Tobi Adegoroye on 22/02/2023.
//

import Foundation
import SwiftUI

public extension Text {
    func sectionHeaderStyle() -> some View {
        self
            .font(.system(.title3))
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .textCase(nil)
    }
}
