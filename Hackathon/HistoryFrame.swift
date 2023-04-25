/* HistoryFrame.swift --> Hackathon. Created by BaymaxCoders on 25/04/23. */

import SwiftUI

struct HistoryFrame: View {
    
    @StateObject private var speeaches = SpeechManager()
    
    let readedText: String
    let date: Date
    let background: String
    
    var body: some View {
        ZStack {
            Image("tarjeta 1")
                .resizable()
                .ignoresSafeArea(.all)
            HStack {
                VStack {
                    Text(readedText)
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                    Text(date, style: .date)
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                }
                // Botón para reproducir el texto leído del historial
                Button {
                    speeaches.speak(readedText)
                } label: {
                    Image(systemName: "speaker.wave.2.circle.fill")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                }
            }
        }.frame(width: 450, height: 200)
    }
}

struct HistoryFrame_Previews: PreviewProvider {
    static var previews: some View {
        HistoryFrame(readedText: "Hola soy una prueba", date: Date(), background: "Background")
    }
}
