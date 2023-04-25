/* ContentView.swift Created by BaymaxCoders on 24/04/23.*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Primera pestaña
            CameraPillView()
                .tabItem {
                    Label("IDENTIFICA TUS MEDICINAS", systemImage: "pills.fill")
                }
            // Segunda pestaña
            CameraBookView()
                .tabItem {
                    Label("Hola", systemImage: "pills.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
