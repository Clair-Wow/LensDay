//
//  ContentView.swift
//  LensDay
//
//  Created by Larry Clair on 11/9/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Persistent storage
    
    @AppStorage("lensStartTime") private var startTimeInterval: Double = Date().timeIntervalSince1970
    @AppStorage("lensDurationDays") private var storedDurationDays: Int = 14  // default 2-week lenses
    
    // Computed Date/Int properties backed by AppStorage
    private var startDate: Date {
        get { Date(timeIntervalSince1970: startTimeInterval) }
        set { startTimeInterval = newValue.timeIntervalSince1970 }
    }
    
    private var durationDays: Int {
        get { storedDurationDays }
        set { storedDurationDays = newValue }
    }
    
    // MARK: - Computed values
    
    private var today: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    private var daysUsed: Int {
        let start = Calendar.current.startOfDay(for: startDate)
        let components = Calendar.current.dateComponents([.day], from: start, to: today)
        return max(components.day ?? 0, 0)
    }
    
    private var daysLeft: Int {
        max(durationDays - daysUsed, 0)
    }
    
    private var endDate: Date? {
        Calendar.current.date(byAdding: .day, value: durationDays, to: startDate)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                
                // Main counter card
                VStack(spacing: 8) {
                    Text("Days Left")
                        .font(.headline)
                    
                    Text("\(daysLeft)")
                        .font(.system(size: 72, weight: .bold, design: .rounded))
                    
                    Text("You’ve worn this pair for \(daysUsed) day\(daysUsed == 1 ? "" : "s").")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)
                
                // Settings controls
                Form {
                    Section(header: Text("Current Pair")) {
                        DatePicker(
                            "Start date",
                            selection: Binding(
                                get: { startDate },
                                set: { startDate = $0 }
                            ),
                            displayedComponents: .date
                        )
                        
                        Stepper(
                            value: Binding(
                                get: { durationDays },
                                set: { durationDays = $0 }
                            ),
                            in: 1...60
                        ) {
                            Text("Lens duration: \(durationDays) day\(durationDays == 1 ? "" : "s")")
                        }
                        
                        if let endDate {
                            Text("Change on: \(endDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    Section {
                        Button {
                            // New pair: reset start to today
                            startDate = Date()
                        } label: {
                            Text("New Pair (Reset Start Date to Today)")
                        }
                    }
                }
            }
            .navigationTitle("LensDay")
        }
    }
}

#Preview {
    ContentView()
}
