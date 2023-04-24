/* ContentView.swift Created by BaymaxCoders on 24/04/23.*/

import SwiftUI

//Aca hay un comentario

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                Text("Hola")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
