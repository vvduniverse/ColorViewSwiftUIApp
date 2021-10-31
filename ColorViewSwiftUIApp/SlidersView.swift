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
    
    @Binding var redValueEntered: String
    @Binding var greenValueEntered: String
    @Binding var blueValueEntered: String
    
    @FocusState var isInputActive: Bool
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Slider(value: $redValue, in: 0...255, step: 1)
                    .accentColor(.red)
                TextField("\(lround(redValue))", text: $redValueEntered)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputActive)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
            }
            HStack {
                Slider(value: $greenValue, in: 0...255, step: 1)
                    .accentColor(.green)
                TextField("\(lround(greenValue))", text: $greenValueEntered)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputActive)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
            }
            HStack {
                Slider(value: $blueValue, in: 0...255, step: 1)
                TextField("\(lround(blueValue))", text: $blueValueEntered)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputActive)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    if ((Double(redValueEntered) != nil) &&
                        (Double(redValueEntered)! >= 0) &&
                        (Double(redValueEntered)! <= 255))
                    {
                        redValue = Double(redValueEntered)!
                        redValueEntered = ""
                    } else {
                        redValueEntered = ""
                    }
                    if ((Double(greenValueEntered) != nil) &&
                        (Double(greenValueEntered)! >= 0) &&
                        (Double(greenValueEntered)! <= 255))
                    {
                        greenValue = Double(greenValueEntered)!
                        greenValueEntered = ""
                    } else {
                        greenValueEntered = ""
                    }
                    if ((Double(blueValueEntered) != nil) &&
                        (Double(blueValueEntered)! >= 0) &&
                        (Double(blueValueEntered)! <= 255))
                    {
                        blueValue = Double(blueValueEntered)!
                        blueValueEntered = ""
                    } else {
                        blueValueEntered = ""
                    }
                    isInputActive = false
                }
            }
        }
    }
}
