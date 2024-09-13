//
//  ContentView.swift
//  ExampleProject
//
//  Created by 박현수 on 9/13/24.
//

import SwiftUI
import NetworkTest

struct ContentView: View {
    @State private var numberString: String = ""
    let printer = TestPrinter()

    var body: some View {
        VStack {
            Text(numberString.isEmpty ? "Loading..." : numberString)
                .padding()

            Button("Fetch Number Fact") {
                Task {
                    numberString = await printer.getNumberString()
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
