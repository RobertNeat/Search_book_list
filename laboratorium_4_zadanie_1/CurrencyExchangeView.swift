//
//  ContentView.swift
//  laboratorium_4_zadanie_1
//
//  Created by apple on 3/28/23.
//

import SwiftUI

struct CurrencyExchangeView: View {
    // Define the currencies and their exchange rates
    let currencies = ["USD", "EUR", "JPY", "GBP"]
    let exchangeRates = [
        "USD": 1.0,
        "EUR": 0.84,
        "JPY": 109.48,
        "GBP": 0.72
    ]
    
    // Define the properties for the input fields
    @State private var selectedCurrencyToBuy = "USD"
    @State private var selectedCurrencyToPay = "EUR"
    @State private var amountToBuy = ""
    
    // Define the calculated property for the output text
    var amountToPay: Double {
        let exchangeRate = exchangeRates[selectedCurrencyToPay]! / exchangeRates[selectedCurrencyToBuy]!
        let amount = Double(amountToBuy) ?? 0.0
        return amount * exchangeRate
    }
    
    var body: some View {
        VStack {
            Spacer()
            // Add the header with the name of the currency exchange
            Text("Kantor wymiany")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            // Add the input fields using pickers and text fields
            Picker("Currency to buy", selection: $selectedCurrencyToBuy) {
                ForEach(currencies, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            
            Picker("Currency to pay", selection: $selectedCurrencyToPay) {
                ForEach(currencies, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            
            TextField("Amount to buy", text: $amountToBuy)
                .keyboardType(.decimalPad)
                .padding(.bottom)
            
            // Add the output text to display the calculated amount
            Text(String(format: "%.2f", amountToPay))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            Spacer()
            
            Text("wymien juz dzisiaj swoje pieniandze \n[to jest reklama]").fontWeight(.light)
        }
        .padding()
    }
}

struct CurrencyExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyExchangeView()
    }
}
