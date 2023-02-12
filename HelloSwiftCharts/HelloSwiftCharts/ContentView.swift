//
//  ContentView.swift
//  HelloSwiftCharts
//
//  Created by Jason on 2/12/23.
//

import Charts
import SwiftUI

struct Pancakes: Identifiable {
    let name: String
    let sales: Int
    
    var id: String { name }
}

let sales: [Pancakes] = [
    .init(name: "Cachapa", sales: 916),
    .init(name: "Injera", sales: 850),
    .init(name: "Crepe", sales: 802),
    .init(name: "Jian Bing", sales: 753),
    .init(name: "Dosa", sales: 654),
    .init(name: "American", sales: 618),
]

struct ContentView: View {
    var body: some View {
        Chart(sales) { element in
            BarMark(
                x: .value("Sales", element.sales),
                y: .value("Name", element.name)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
