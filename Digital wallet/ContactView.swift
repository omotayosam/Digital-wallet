//
//  ContactView.swift
//  Digital wallet
//
//  Created by omotayo ayomide on 15/04/2024.
//

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String // Name of the image in the asset catalog
    var phoneNumber: String
    var isRecent: Bool // Indicates if the contact is recent
}

let contacts: [Contact] = [
    Contact(name: "Samantha", imageName: "person1", phoneNumber: "123-456-7890", isRecent: true),
    Contact(name: "Rose Hope", imageName: "person2", phoneNumber: "234-567-8901", isRecent: false),
    Contact(name: "Angela Smith", imageName: "person3", phoneNumber: "345-678-9012", isRecent: true),
    Contact(name: "Andrea Summer", imageName: "person4", phoneNumber: "456-789-0123", isRecent: true),
    Contact(name: "Karen Williams", imageName: "person5", phoneNumber: "567-890-1234", isRecent: false),
    Contact(name: "Thomas Wise", imageName: "person6", phoneNumber: "678-901-2345", isRecent: false),
    Contact(name: "Eve", imageName: "person7", phoneNumber: "789-012-3456", isRecent: false),
    Contact(name: "Frank", imageName: "person8", phoneNumber: "890-123-4567", isRecent: true),
    Contact(name: "Grace", imageName: "person9", phoneNumber: "901-234-5678", isRecent: false),
    Contact(name: "Henry", imageName: "person10", phoneNumber: "012-345-6789", isRecent: true)
]

struct ContactView: View {
    
    @Environment(\.presentationMode) var presentationMode
    //@State private var searchText: String = ""
    var backButtonPlacement: ToolbarItemPlacement {
            #if os(iOS)
            ToolbarItemPlacement.navigationBarLeading
            #else
            ToolbarItemPlacement.navigation
            #endif
        }
    @State private var searchText = ""
    
    var filteredRecentContacts: [Contact] {
            if searchText.isEmpty {
                return contacts.filter { $0.isRecent }
            } else {
                return contacts.filter { $0.isRecent && $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
        
        var filteredAllContacts: [Contact] {
            if searchText.isEmpty {
                return contacts
            } else {
                return contacts.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
        
    
    var body: some View {
        NavigationView {
                   VStack {
                       SearchBar(text: $searchText)
                           .padding(.horizontal)
                       
                       List {
                           Section(header: Text("Recent Contacts")) {
                               ForEach(filteredRecentContacts) { contact in
                                   NavigationLink(destination: SendView(contact: contact)) {
                                                                   ContactRow(contact: contact)
                                                               }
                               }
                               .listRowSeparator(.hidden)
                           }
                           
                           Section(header: Text("All Contacts")) {
                               ForEach(filteredAllContacts) { contact in
                                   NavigationLink(destination: SendView(contact: contact)) {
                                                                  ContactRow(contact: contact)
                                                              }
                               }
                               .listRowSeparator(.hidden)
                           }
                       }
                       .environment(\.defaultMinListRowHeight, 70)
                       .listStyle(GroupedListStyle())
                       .scrollContentBackground(.hidden)
                   }
                   .background(Color.white)
               }
        
        .navigationTitle("Contact")
        .navigationBarBackButtonHidden(true)
        .toolbar {
                    ToolbarItem(placement: backButtonPlacement) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                        }
                        .foregroundStyle(Color.customPurple)
                    }
                }
    }
}

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Color.random
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.headline)
                
                Text("bank - \(contact.phoneNumber)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Search", text: $text)
                .padding(.vertical, 15)
                .padding(.horizontal, 12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 36) // Increase horizontal padding to accommodate the icon
            
            Image(systemName: "magnifyingglass") // Magnifying glass icon
                .foregroundColor(.gray)
                .padding(.trailing, 45)
        }
    }
}




#Preview{
    ContactView()
}
