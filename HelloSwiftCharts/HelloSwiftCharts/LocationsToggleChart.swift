//
//  LocationsToggleChart.swift
//  HelloSwiftCharts
//
//  Created by Jason on 2/12/23.
//

import Charts
import SwiftUI

enum City {
    case cupertino
    case sanFrancisco
}

let sfData: [SalesSummary] = [
    /// Monday
    .init(weekday: makeDate(2022, 5, 2), sales: 54),
    /// Tuesday
    .init(weekday: makeDate(2022, 5, 3), sales: 42),
    /// Wednesday
    .init(weekday: makeDate(2022, 5, 4), sales: 88),
    /// Thursday
    .init(weekday: makeDate(2022, 5, 5), sales: 49),
    /// Friday
    .init(weekday: makeDate(2022, 5, 6), sales: 42),
    /// Saturday
    .init(weekday: makeDate(2022, 5, 7), sales: 125),
    /// Sunday
    .init(weekday: makeDate(2022, 5, 8), sales: 67)
]

struct LocationsToggleChart: View {
    @State var city: City = .cupertino
    
    
    var body: some View {
        VStack {
            Picker("City", selection: $city) {
                Text("Cupertino").tag(City.cupertino)
                Text("San Francisco").tag(City.sanFrancisco)
            }
            .pickerStyle(.segmented)
            Chart(cupertinoData) { element in
                BarMark(x: .value("Day", element.weekday),
                        y: .value("Sales", element.sales)
                )
            }
        }
        .padding()
    }
}

struct LocationsToggleChart_Previews: PreviewProvider {
    static var previews: some View {
        LocationsToggleChart()
    }
}
