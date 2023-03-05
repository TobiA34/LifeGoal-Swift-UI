//
//  ContentView.swift
//  CustomForm2
//
//  Created by Tobi Adegoroye on 10/02/2023.
//

import SwiftUI
import CoreData



struct ContentView: View {
    @State var password: String = ""
    @State var category: String = ""
    @State var date: Date
    @State var color: Color
    @State private var searchText = ""
    
    
    @State private var showingSheet = false
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(entity: FormData.entity(), sortDescriptors: [])
    private var forms: FetchedResults<FormData>
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Today")
                    .padding(.leading,18)
                    .font(.system(size: 16))
                    
                List {
                    ForEach(forms) { form in
                        VStack(alignment: .leading) {
                            HStack {
                                VStack {
                                    Text(form.title ?? "")
                                        .padding(.bottom,5)
                                    
                                    if let newReminderDate = form.reminderDate {
                                        if Date.now > newReminderDate {
                                            HStack {
                                                Image(systemName: "bell.fill")
                                                Text(newReminderDate, style: .date)
                                                    .font(.system(size: 16))
                                                    .foregroundColor(.red)
                                             }
                                            .padding(.bottom,10)
                                        } else {
                                            HStack {
                                                Image(systemName: "bell.fill")
                                                Text(newReminderDate, style: .date)
                                                    .font(.system(size: 16))
                                            }
                                        }
                                    }
                                    Text(form.profileDesc ?? "")
                                        .font(.system(size: 12))
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                }
                                .frame(width: 200)
                                Spacer()
                                VStack {
                           
                                    Text(form.category ?? "")
                                        .padding(4)
                                        .font(.system(size: 40))
                                        .background(Rectangle()
                                            .border(Color(hex: form.color ?? "")!, width: 4))
                                        .cornerRadius(8)

                                }
                            }
                            Spacer()
                        }.frame(width: .infinity)
                    }
                    .onDelete(perform: removeGoals)
                }
                .navigationTitle("Goals")
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
        func removeGoals(at offsets: IndexSet) {
            for index in offsets {
                let form = forms[index]
                viewContext.delete(form)
            }
            try? viewContext.save()
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(date: Date.now, color: .blue).environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
    

