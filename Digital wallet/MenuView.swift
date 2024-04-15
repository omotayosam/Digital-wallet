//
//  MenuView.swift
//  Digital wallet
//
//  Created by omotayo ayomide on 14/04/2024.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    //@State private var searchText: String = ""
    var backButtonPlacement: ToolbarItemPlacement {
            #if os(iOS)
            ToolbarItemPlacement.navigationBarLeading
            #else
            ToolbarItemPlacement.navigation
            #endif
        }
    var body: some View {
        
      
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            VStack{
                VStack{
                    HStack{
                        Text("Shortcuts")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("Customize")
                            .foregroundStyle(Color.fontColorPurple)
                    }
                    .padding(.horizontal, 32)
                    
                    VStack{
                        MenuButton(title: "Grocery", icon: "cart") {}
                        Divider()
                        MenuButton(title: "Entertainment", icon: "ent") {}
                        Divider()
                        MenuButton(title: "Equipment", icon: "equipments") {}
                        Divider()
                        MenuButton(title: "Office Items", icon: "office") {}
                        
                    }
                    .padding(.horizontal, 32)

                    .frame(maxWidth: .infinity, maxHeight: 256) // 1
                            .accentColor(Color.black)
                            .background(Color.white)
                }
                .padding(.vertical, 20)
                
                
                
                VStack{
                    HStack{
                        Text("Shortcuts")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("Customize")
                            .foregroundStyle(Color.fontColorPurple)
                    }
                    .padding(.horizontal, 32)
                    
                    VStack{
                        MenuButton(title: "Transaction History", icon: "history") {}
                        Divider()
                        MenuButton(title: "Request Payment", icon: "request") {}
                        Divider()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack {
                                Image(systemName: "gear") // Use systemName for better accessibility
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(maxWidth: 40, maxHeight: 40)
                                .background(Color.iconcolor)
                                .foregroundColor(.white)
                                .cornerRadius(9)
                                
                            Text("Settings")
                            }
                            .frame(maxWidth: .infinity ,alignment: .leading)
                        })
                        Divider()
                        MenuButton(title: "Help", icon: "help") {}
                        
                    }
                    .padding(.horizontal, 32)

                    .frame(maxWidth: .infinity, maxHeight: 256) // 1
                            .accentColor(Color.black)
                            .background(Color.white)
                }
            }
            
            
            
        }
            
            
            .navigationTitle("Menu")
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

#Preview {
    MenuView()
}


struct MenuButton: View {

  // Properties for customization
  var title: String
    var icon: String
  var action: () -> Void // Closure for button action


  var body: some View {
      Button{
          action()
      }label:{
    HStack {
    Image(icon) // Use systemName for better accessibility
        .resizable()
        .frame(maxWidth: 40, maxHeight: 40)
    Text(title)
    }
    .frame(maxWidth: .infinity ,alignment: .leading)
    //.padding(.vertical, 20)
}
  }
}
