//
//  Settings.swift
//  TodoList
//
//  Created by Tobi Adegoroye on 06/02/2023.
//

import SwiftUI

struct SettingsVC: View {
    
    @State private var showingPopover = false

    
    var body: some View {
        NavigationView {
                 List {
                    Section {
                        Button {
                            
                        } label: {
                            HStack {
                                Label("Theme", systemImage: "paintpalette")
                                Spacer()
                                Image(systemName: "greaterthan")
                            }
                        }

                    }
                    Section {
                        Button {
                            
                        } label: {
                            HStack {
                                Label("Leave a review", systemImage: "star.circle")
                                Spacer()
                                Image(systemName: "greaterthan")
                            }
                        }

                    }
                     Section {
                         Button {
                             
                         } label: {
                             HStack {
                                 Label("Share", systemImage: "paperplane.fill")
                                 Spacer()
                                 Image(systemName: "greaterthan")
                             }
                         }
                         Button {
                             
                         } label: {
                             HStack {
                                 Label("Notification", systemImage: "bell.fill")
                                 Spacer()
                                 Image(systemName: "greaterthan")
                             }
                         }
                         Button {
                             
                         } label: {
                             HStack {
                                 Label("Haptics", systemImage: "water.waves")
                                 Spacer()
                                 Image(systemName: "greaterthan")
                             }
                         }

                     }

                }.navigationBarTitle(
                    "Settings", displayMode: .inline
                )
            

            }
        }
}

struct SettingsVC_Previews: PreviewProvider {
    static var previews: some View {
        SettingsVC()
    }
}
