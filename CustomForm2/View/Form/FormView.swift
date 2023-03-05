//
//  FormView.swift
//  CustomForm2
//
//  Created by Tobi Adegoroye on 10/02/2023.
//

import SwiftUI

struct FormView: View {
    @ObservedObject var profileText  = TextBindingManager(limit: 100)

    @State var title: String = ""
    @State var options = ["💰", " ✈️", "🏃", "📚"] // 1
    @State var selectedItem = "💰" // 2
    @State var date: Date
 
    @State var color: Color = .blue
    @FocusState var isInputActive: Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    var enabled = true
    
    var body: some View {
        NavigationView {
            Form {
                TextField("password", text: $title)
                
                Picker("Pick a Category", selection: $selectedItem) { // 3
                    ForEach(options, id: \.self) { item in // 4
                        Text(item) // 5
                    }
                    
                }
                DatePicker("Select a date", selection: $date, displayedComponents: .date)
                
                ColorPicker(selection: $color, supportsOpacity: false) {
                    Label("Choose A colour",systemImage: "paintpalette")
                        .symbolVariant(.fill)
                    
                }
                Section(header: Text("Descrption").sectionHeaderStyle()) {
                    TextEditor(text: $profileText.text)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                        .navigationTitle("New Life Goal")
                        .frame(height: 250)
                        .focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                    
                }
            }.navigationTitle("New Life Goal")
                .toolbar {
                    // 1
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button("save") {
                            let login = Login(title: title,category: selectedItem, desc: profileText.text, date: date, color: color)
                            saveForm(login: login)
                        }.tint(.blue)
                            .disabled(title.isEmpty)
                            .disabled(selectedItem.isEmpty)
                        
                    }
                    // 2
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button("Cancel") {
                            dismiss()
                        }.tint(.blue)
                    }
                }
            
        }
        
    }
    
    func saveForm(login:Login) {
        let form = FormData(context: viewContext)
        form.title = login.title
        form.category = login.category
        form.profileDesc = login.desc
        form.reminderDate = login.date
        form.color = login.color.toHex()
        saveContext()
        simpleSuccess()
        dismiss()
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch  {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}
struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(profileText: TextBindingManager(limit: 100), date: Date.now)
    }
}






class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 100){
        characterLimit = limit
    }
}
