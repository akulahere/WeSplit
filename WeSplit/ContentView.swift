//
//  ContentView.swift
//  WeSplit
//
//  Created by Dmytro Akulinin on 27.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Form {
        Section {
          Text("Hello, world!")
        }
        
        Section {
          Text("Hello, world!")
          Text("Hello, world!")
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
