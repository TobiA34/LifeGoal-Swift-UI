//
//  CustomForm2App.swift
//  CustomForm2
//
//  Created by Tobi Adegoroye on 10/02/2023.
//

import SwiftUI

@main
struct CustomForm2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
            WindowGroup {
                TabView {
                    ContentView(date: Date.now,color: .blue)
                        .tabItem{
                            Label("Goal ", systemImage: "target")
                        }
                        .environment(\.managedObjectContext,
                                     persistenceController.container.viewContext)
                    CategoryVC()
                        .tabItem{
                            Label("Category ", systemImage: "list.bullet.rectangle")
                        }
                    
                    SettingsVC()
                        .tabItem{
                            Label("Settings ", systemImage: "gearshape")
                        }
                }
            }
        }
}
