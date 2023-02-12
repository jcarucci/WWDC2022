//
//  ContentView.swift
//  HelloSwiftCharts
//
//  Created by Jason on 2/12/23.
//

import Charts
import SwiftUI

struct ContentView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Name", "Cachappa"),
                y: .value("Sales", 916)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
