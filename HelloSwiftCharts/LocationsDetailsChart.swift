//
//  LocationsDetailsChart.swift
//  HelloSwiftCharts
//
//  Created by Jason on 2/12/23.
//

import Charts
import SwiftUI

struct Series: Identifiable {
    let city: String
    let sales: [SalesSummary]
    
    var id: String { city }
}

let seriesData: [Series] = [
    Series(city: "Cupertino", sales: cupertinoData),
    Series(city: "San Francisco", sales: sfData)
]

struct LocationsDetailsChart: View {
    var body: some View {
        Chart(seriesData) { series in
            ForEach(series.sales) { element in
                LineMark(x: .value("Day", element.weekday),
                        y: .value("Sales", element.sales)
                )
                .foregroundStyle(by: .value("City", series.city))
                .symbol(by: .value("City", series.city))
            }
            
        }
        .padding()
        .frame(height: 300)
    }
}

struct LocationsDetailsChart_Previews: PreviewProvider {
    static var previews: some View {
        LocationsDetailsChart()
    }
}
