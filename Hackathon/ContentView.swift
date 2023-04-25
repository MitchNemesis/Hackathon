/* ContentView.swift Created by BaymaxCoders on 24/04/23.*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Primera pestaña
            HistoryView()
                .tabItem {
                    Label("HISTORIAL", systemImage: "clock.fill")
                }
            // Segunda pestaña
            CameraPillView()
                .tabItem {
                    Label("IDENTIFICA", systemImage: "pills.fill")
                }
            // Tercera pestaña
            CameraBookView()
                .tabItem {
                    Label("LEE", systemImage: "book.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
