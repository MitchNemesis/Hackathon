/* HistoryLog.swift --> Hackathon. Created by BaymaxCoders on 25/04/23. */

import SwiftUI

struct HistoryLog: Identifiable, Hashable {
    var id = UUID()
    var readedText: String
    var date: Date
    var image: String
}
