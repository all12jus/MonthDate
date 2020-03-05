//
//  ContentView.swift
//  MonthDate WatchKit Extension
//
//  Created by Justin Allen on 10/12/19.
//  Copyright © 2019 Justin Allen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        let date = String(format: "%@ %@", arguments: [Date().month, Date().day])
//        let text = Text(Date().watchAppContent)
//        return text
        
        let date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "MMMM dd yyyy"
        
        return VStack(alignment: .center, spacing: 20) {
            Text(dateFormatter.string(from: date))
            Text(dateFormatter1.string(from: date))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
