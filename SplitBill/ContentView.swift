//
//  ContentView.swift
//  SplitBill
//
//  Created by Pramuditha Muhammad Ikhwan on 02/03/25.
//

import SwiftUI

struct ContentView: View {
    let appTitle: String = "Patungan"
    @State private var totalAmount: String = ""
    @State private var numberOfPeople: Int = 1
    
    func calculateTotalAmount() -> Double {
        let total = Double(totalAmount) ?? 0
        let finalAmount = total / Double(numberOfPeople)
        return finalAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                // Capitalize Header
                Section(header: Text("Total Amount").font(.headline)) {
                    TextField("Total Amount", text: $totalAmount)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Jumlah Orang").font(.headline)) {
                    Stepper(value: $numberOfPeople, in: 1...10) {
                        Text("\(numberOfPeople) orang")
                    }
                }
                Section(header: Text("Biaya per Orang").font(.headline)) {
                    Text("Rp\(calculateTotalAmount().formatted())")
                }
            }.navigationTitle(appTitle)
        }
    }
}

#Preview {
    ContentView()
}
