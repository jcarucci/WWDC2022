//
//  CupertinoDetailsChart.swift
//  HelloSwiftCharts
//
//  Created by Jason on 2/12/23.
//

import Charts
import SwiftUI

func makeDate(_ year: Int, _ month: Int, _ day: Int) -> Date {
    let calendar = Calendar(identifier: .gregorian)
    // calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    let components = DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    return calendar.date(from: components)!
}

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Int
    
    var id: Date { weekday }
}

let cupertinoData: [SalesSummary] = [
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

struct CupertinoDetailsChart: View {
    var body: some View {
        Chart(cupertinoData) { element in
            BarMark(
                x: .value("Day", element.weekday, unit: .day), // unit doesn't seem to work
                y: .value("Sales", element.sales)
            )
        }
        .padding()
    }
}

struct CupertinoDetailsChart_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoDetailsChart()
    }
}
