//
//  ContentView.swift
//  Authenticate
//
//  Created by shehan karunarathna on 2022-03-15.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
  @State var auth:Bool = false
    var body: some View {
      NavigationView{
        VStack{
          Button{
            authenticate()
          }label: {
            Text("Press")
              .padding()
              .padding(.horizontal)
              .background(Color.blue)
              .foregroundColor(.white)
              .clipShape(Capsule())
          }
          NavigationLink(destination: SecondView(), isActive: $auth) { EmptyView() }
        }


      }

    }
  func authenticate() {
      let context = LAContext()
      var error: NSError?

      if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
          let reason = "Please authenticate yourself to unlock your places."

          context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

              if success {
                print("auth successed")
                auth.toggle()
              } else {
                  // error
              }
          }
      } else {
          // no biometrics
      }
  }
}

struct SecondView : View{
  var body: some View {
    Text("Secon View")
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
