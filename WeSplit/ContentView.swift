//
//  ContentView.swift
//  WeSplit
//
//  Created by Dmytro Akulinin on 27.07.2022.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 20

  @FocusState private var amountIsFocused: Bool
  let currencyFormater = Locale.current.currencyCode ?? "USD"
  let localCurrency: FloatingPointFormatStyle<Double>.Currency =
    .currency(code: Locale.current.currencyCode ?? "USD")

//  let currency: FloatingPointFormatStyle<Double>.Currency = Locale.current.currencyCode

  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentage)
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    
    return amountPerPerson
  }
  
  var totalAmount: Double {
    let tipSelection = Double(tipPercentage)
    let totalTips = checkAmount / 100 * tipSelection
    let sumOfTipsAndCheck = totalTips + checkAmount
    return sumOfTipsAndCheck
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField(
            "Amount", value: $checkAmount,
            format: localCurrency
          )
          .keyboardType(.decimalPad)
          .focused($amountIsFocused)

          Picker("Number of People", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }
        Section {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0..<100) {
              Text($0, format: .percent)
            }
          }
        } header: {
          Text("How much tip do you want to leave?")
        }
          
        Section {
          Text(
            totalPerPerson,
            format: localCurrency
          )
        } header: {
          Text("Amount per person")
        }
        Section {
          Text(
            totalAmount,
            format: localCurrency
          )
        } header: {
          Text("Total amount")
        }
      }
      .navigationTitle("WeSplit")
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Spacer()
          
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
