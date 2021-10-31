//
//  SliderView.swift
//  ColorViewSwiftUIApp
//
//  Created by Vahtee Boo on 31.10.2021.
//

import SwiftUI

struct ColorSlidersView: View {
    
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    @Binding var redValueT: String
    @Binding var greenValueT: String
    @Binding var blueValueT: String
    
    @FocusState var isInputActive: Bool
    
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Slider(value: $redValue, in: 0...255, step: 1)
                    .accentColor(.red)
                TextField("\(lround(redValue))", text: $redValueT)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputActive)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
            }
            HStack {
                Slider(value: $greenValue, in: 0...255, step: 1)
                    .accentColor(.green)
                TextField("\(lround(greenValue))", text: $greenValueT)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputActive)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
            }
            HStack {
                Slider(value: $blueValue, in: 0...255, step: 1)
                TextField("\(lround(blueValue))", text: $blueValueT)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputActive)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    redValue = Double(redValueT)!
                    greenValue = Double(greenValueT)!
                    blueValue = Double(blueValueT)!
                    isInputActive = false
                }
            }
        }
    }
}
