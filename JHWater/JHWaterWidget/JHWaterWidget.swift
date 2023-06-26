//
//  JHWaterWidget.swift
//  JHWaterWidget
//
//  Created by JH on 2023/06/24.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DrinkWaterEntry {
		let totalCount = UserDefaults.shared.integer(forKey: "totalCount")
        let entry = DrinkWaterEntry(
            date: Date(),
            glassesOfWater: Array(repeating: false, count: totalCount),
            configuration: ConfigurationIntent()
        )
        return entry
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DrinkWaterEntry) -> Void) {
        let count = UserDefaults.shared.integer(forKey: "drinkCount")
		let glassesOfWater = getGlassesOfWater(with: count)
		
        let entry = DrinkWaterEntry(
            date: Date(),
            glassesOfWater: glassesOfWater,
            configuration: ConfigurationIntent()
        )
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [DrinkWaterEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
			
			let count = UserDefaults.shared.integer(forKey: "drinkCount")
			let glassesOfWater = getGlassesOfWater(with: count)
            let entry = DrinkWaterEntry(
                date: entryDate,
                glassesOfWater: glassesOfWater,
                configuration: configuration
            )
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
	
	private func getGlassesOfWater(with drinkwater: Int) -> [Bool] {
		let totalCount = UserDefaults.shared.integer(forKey: "totalCount")
		var arr = [Bool]()
		for _ in 0..<drinkwater {
			arr.append(true)
		}
		for _ in 0..<(totalCount - drinkwater) {
			arr.append(false)
		}
		return arr
	}
}

struct DrinkWaterEntry: TimelineEntry {
    let date: Date
    let glassesOfWater: [Bool]
    let configuration: ConfigurationIntent
}

struct JHWaterWidgetEntryView: View {
    var entry: Provider.Entry

    var drinkWater: Int {
        entry.glassesOfWater.filter { $0 }.count
    }

    var body: some View {
        ZStack {
            VStack(spacing: 1) {
                ForEach(0 ..< entry.glassesOfWater.count) { index in
                    if entry.glassesOfWater.reversed()[index] {
                        Rectangle()
                            .fill(Color.teal)
                    } else {
                        Rectangle()
                            .fill(Color.white)
                    }
                }
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("\(drinkWater)잔")
                        .font(.title)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3)
                }
                .padding(.horizontal)
            }
            .padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
        }
    }
}

struct JHWaterWidget: Widget {
    let kind: String = "JHWaterWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            JHWaterWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct JHWaterWidget_Previews: PreviewProvider {
    static var previews: some View {
        JHWaterWidgetEntryView(entry: DrinkWaterEntry(date: Date(), glassesOfWater: [true, true, true, true, true, false, false, false], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.com.jeehge.water.info"
        return UserDefaults(suiteName: appGroupId)!
    }
}
