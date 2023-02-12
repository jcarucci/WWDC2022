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
    .init(weekday: makeDate(2022, 5, 2), sales: 81),
    /// Tuesday
    .init(weekday: makeDate(2022, 5, 3), sales: 90),
    /// Wednesday
    .init(weekday: makeDate(2022, 5, 4), sales: 52),
    /// Thursday
    .init(weekday: makeDate(2022, 5, 5), sales: 72),
    /// Friday
    .init(weekday: makeDate(2022, 5, 6), sales: 84),
    /// Saturday
    .init(weekday: makeDate(2022, 5, 7), sales: 84),
    /// Sunday
    .init(weekday: makeDate(2022, 5, 8), sales: 137)
]

struct LocationsToggleChart: View {
    @State var city: City = .cupertino
    
    var data: [SalesSummary] {
        switch city {
        case .cupertino:
            return cupertinoData
        case .sanFrancisco:
            return sfData
        }
    }
    
    var body: some View {
        VStack {
            Picker("City", selection: $city) {
                Text("Cupertino").tag(City.cupertino)
                Text("San Francisco").tag(City.sanFrancisco)
            }
            .pickerStyle(.segmented)
            Chart(data) { element in
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
