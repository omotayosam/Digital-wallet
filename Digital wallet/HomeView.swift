//
//  HomeView.swift
//  Digital wallet
//
//  Created by omotayo ayomide on 14/04/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    var body: some View {
       NavigationStack(path: $path){
       
                ZStack{
                    Color.backGround.ignoresSafeArea()
                    
                    
                    VStack{
                        Spacer()
                        VStack{
                            Text("Your balance")
                                .fontWeight(.regular)
                                .foregroundStyle(Color.gray)
                            Text("Rp 8.250.000")
                                .fontWeight(.regular)
                                .font(.largeTitle)
                                .foregroundStyle(Color.fontColorPurple)
                        }
                        
                        
                        Spacer()
                        
                        
                        HStack{
                            NavigationLink(destination: ContactView()) { // Use NavigationLink
                                          VStack {
                                              Image(.transfer) // Using systemName for accessibility
                                              .resizable()
                                              .frame(maxWidth: 48, maxHeight: 48)
                                            Text("Transfer")
                                              .foregroundStyle(Color.butFont)
                                          }
                                        }
                            
                            Spacer()
                            NavigationLink(destination: {
                                //MenuView()
                            }, label: {
                                VStack{
                                    Image(.topup)
                                        .resizable()
                                        .frame(maxWidth: 48, maxHeight: 48)
                                    Text("Top-Up")
                                        .foregroundStyle(Color.butFont)
                                        
                                }
                            })
                            Spacer()
                            NavigationLink(destination: {
                                //MenuView()
                            }, label: {
                                VStack{
                                    Image(.bill)
                                        .resizable()
                                        .frame(maxWidth: 48, maxHeight: 48)
                                    Text("Bill")
                                        .foregroundStyle(Color.butFont)
                                        
                                }
                            })
                            Spacer()
                            NavigationLink(destination: {
                                MenuView()
                            }, label: {
                                VStack{
                                    Image(.more)
                                        .resizable()
                                        .frame(maxWidth: 48, maxHeight: 48)
                                    Text("More")
                                        .foregroundStyle(Color.butFont)
                                        
                                }
                            })
                        }
                        .padding(.horizontal, 30)
                        Spacer()
                        
                        
                        VStack{
                            ScrollView{
                                VStack{
                                    Text("Transactions")
                                        .foregroundStyle(Color.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.vertical)
                                    Spacer()
                                    VStack{
                                        ThButton(title: "Grocery", price: "326.80", date: "Nov 17", storeName: "Minimarket Anugrah", icon: "cart") {}
                                        ThButton(title: "Entertainment", price: "326.80", date: "Nov 17", storeName: "Football Game", icon: "ent") {}
                                        ThButton(title: "Equipment", price: "326.80", date: "Nov 17", storeName: "DLSR Camera", icon: "equipments") {}
                                        ThButton(title: "Office Items", price: "326.80", date: "Nov 17", storeName: "Minimarket Anugrah", icon: "office") {}
                                        ThButton(title: "Grocery", price: "326.80", date: "Nov 17", storeName: "Stationary", icon: "cart") {}
                                        
                                    }
                                    
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding(.horizontal, 28)
                        .frame(maxWidth: .infinity, maxHeight: 400)
                         .background(.white)
                         .clipShape(
                         .rect(cornerRadii: RectangleCornerRadii(topLeading: 30, topTrailing: 30)))
                                        
                    }
                   
                }
            
                .navigationBarBackButtonHidden(true) 
       }
        
        
    }
    
}

#Preview {
    HomeView()
}


struct ThButton: View {

  // Properties for customization
  var title: String
  var price: String
  var date: String
  var storeName: String
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
    VStack(alignment: .leading) {
        HStack {
        Text(title)
        Spacer()
        Text(price)
        }
        .font(.subheadline)
        .fontWeight(.medium)
        .foregroundStyle(Color.fontColorPurple)
        HStack {
        Text(date)
        Spacer()
        Text(storeName)
        }
        .fontWeight(.regular)
        .foregroundStyle(Color.gray)
    }
    }
    .padding(.vertical, 20)
}
  }
}

