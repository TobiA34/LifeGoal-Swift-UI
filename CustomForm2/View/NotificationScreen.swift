//
//  NotificationScreen.swift
//  LifeGoals
//
//  Created by Tobi Adegoroye on 24/02/2023.
//

import SwiftUI

struct NotificationScreen: View {
    @State private var isToggle = false
    var body: some View {
        VStack {
            Toggle("Turn on notification", isOn: $isToggle)
        }
    }
}

struct NotificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationScreen()
    }
}
