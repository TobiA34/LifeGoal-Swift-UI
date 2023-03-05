//
//  CategoryVC.swift
//  LifeGoals
//
//  Created by Tobi Adegoroye on 19/02/2023.
//

import SwiftUI

struct CategoryVC: View {
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                }
            }
            .navigationTitle("Category")
            .toolbar {
                Button() {
                    showingSheet.toggle()
                }label: {
                    Label("", systemImage: "plus")
                        .tint(.white)
                }.sheet(isPresented: $showingSheet) {
                    FormView(profileText: TextBindingManager(limit: 100), date: Date.now)
                }
            }

        }
    }
}

struct CategoryVC_Previews: PreviewProvider {
    static var previews: some View {
        CategoryVC()
    }
}
