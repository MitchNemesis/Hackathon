/* HistoryView.swift --> Hackathon. Created by CEDAM02 on 25/04/23. */

import SwiftUI

struct HistoryView: View {
    
    @State var logs: [HistoryLog] = [
        HistoryLog(readedText: "Uno", date: Date(), image: "tarjeta 1"),
        HistoryLog(readedText: "Dos", date: Date(), image: "tarjeta 2"),
        HistoryLog(readedText: "Tres", date: Date(), image: "tarjeta 3"),
        HistoryLog(readedText: "Cuatro", date: Date(), image: "tarjeta 4"),
        HistoryLog(readedText: "Cinco", date: Date(), image: "tarjeta 5"),
        HistoryLog(readedText: "Seis", date: Date(), image: "tarjeta 6"),
    ]
    
    var body: some View {
        Text("Hola")
        ZStack {
            VStack {
                Text("Historial de capturas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                ScrollView {
                    ForEach(logs) { historyLog in
                        HistoryFrame(readedText: historyLog.readedText, date: historyLog.date, background: historyLog.image)
                    }
                }
            }
        }
    }
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
