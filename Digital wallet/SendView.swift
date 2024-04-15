import SwiftUI

struct SendView: View {
    let contact: Contact
    @State private var selectedDetail = 0
    @State private var enteredPhoneNumber = ""
    @State private var string = "0"
    var recentContacts: [Contact] {
        return contacts.filter { $0.isRecent }
    }
    @State private var isSending = false
       @State private var offset: CGFloat = 0
    @State private var circleOffset: CGFloat = 0
    
    
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
        VStack {
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 315, height: 80)
                    .foregroundColor(.backGround)
            
                HStack {
                    
                    Menu {
                        ForEach(recentContacts) { recentContact in
                            Button(action: {
                                self.selectedDetail = 0
                            }) {
                                Text("\(recentContact.name) - \(recentContact.phoneNumber)")
                            }
                        }
                    } label: {
                        
                        HStack {
                            Color.teal
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.trailing, 10)
                            
                            VStack(alignment: .leading) {
                                Text(contact.name)
                                    .font(.headline)
                                    .foregroundStyle(Color(.customPurple))
                                
                                Text("bank - \(contact.phoneNumber)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            
                            
                            Image(systemName: "chevron.down")
                                .padding(.horizontal, 20)
                        }
                        
                    }
                    .foregroundColor(.blue)
                    .padding()
                }
            }
            
            Spacer()
            
            VStack {
                        HStack {
                            Spacer()
                            Text(string)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.system(size: 50))
                                .foregroundColor(.customPurple)
                                .fontWeight(.regular)
                            
                        }
                        .padding([.leading, .trailing])
                
                        Divider()
                        KeyPad(string: $string)
              
                    ZStack(alignment: .leading) {
                                   RoundedRectangle(cornerRadius: 30)
                                       .frame(width: 315, height: 64)
                                       .foregroundColor(.blue)
                                       .overlay(
                                           Text("SWIPE TO SEND")
                                               .foregroundColor(.white)
                                               .font(.headline)
                                               .fontWeight(.semibold)
                                       )
                                   
                                   Circle()
                                       .frame(width: 50, height: 50)
                                       .foregroundColor(.white)
                                       .overlay(
                                           Image(systemName: "arrow.right")
                                            .resizable()
                                            .frame(maxWidth: 13, maxHeight: 9)
                                            .foregroundColor(.customPurple)
                                       )
                                       .offset(x: circleOffset)
                                       .gesture(
                                           DragGesture()
                                               .onChanged { value in
                                                   self.circleOffset = value.translation.width
                                                   if self.circleOffset >= 50 {
                                                       self.send()
                                                   }
                                               }
                                               .onEnded { value in
                                                   if self.circleOffset >= 50 {
                                                       self.circleOffset = 0
                                                   } else {
                                                       self.circleOffset = 0
                                                       // Additional handling if needed
                                                   }
                                               }
                                       )
                               }
                    }
                    .font(.largeTitle)
                        .padding()
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
    
    func send() {
           // Implement send functionality here
           print("Sending to \(enteredPhoneNumber)")
           // Reset the entered phone number after sending
           enteredPhoneNumber = ""
       }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView(contact: Contact(name: "John", imageName: "person1", phoneNumber: "123-456-7890", isRecent: true))
    }
}

struct KeyPadButton: View {
    var key: String

    var body: some View {
        Button(action: { self.action(self.key) }) {
            Color.clear
                //.overlay(RoundedRectangle(cornerRadius: 12)
                    //.stroke(Color.accentColor))
                .overlay(Text(key))
                .foregroundColor(.gray)
        }
    }

    enum ActionKey: EnvironmentKey {
        static var defaultValue: (String) -> Void { { _ in } }
    }

    @Environment(\.keyPadButtonAction) var action: (String) -> Void
}

extension EnvironmentValues {
    var keyPadButtonAction: (String) -> Void {
        get { self[KeyPadButton.ActionKey.self] }
        set { self[KeyPadButton.ActionKey.self] = newValue }
    }
}

#if DEBUG
struct KeyPadButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadButton(key: "8")
            .padding()
            .frame(width: 125, height: 80)
            .previewLayout(.sizeThatFits)
    }
}
#endif


struct KeyPadRow: View {
    var keys: [String]

    var body: some View {
        HStack {
            ForEach(keys, id: \.self) { key in
                KeyPadButton(key: key)
            }
        }
    }
}


struct KeyPad: View {
    @Binding var string: String

    var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: [".", "0", "⌫"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
    }

    private func keyWasPressed(_ key: String) {
        switch key {
        case "." where string.contains("."): break
        case "." where string == "0": string += key
        case "⌫":
            string.removeLast()
            if string.isEmpty { string = "0" }
        case _ where string == "0": string = key
        default: string += key
        }
    }
}
