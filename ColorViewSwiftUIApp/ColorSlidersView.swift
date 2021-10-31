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
    
    private func valueValid(_ valueEntered: String) -> Bool {
        var znak = false

        if let value = Double(valueEntered) {
            if value >= 0 && value <= 255 {
                znak = true
            }
        }
        return znak
    }
    
    var body: some View {
        VStack(spacing: 25) {
            SliderView(colorValue: $redValue, textEntered: $redValueEntered, sliderColor: .red)
            SliderView(colorValue: $greenValue, textEntered: $greenValueEntered, sliderColor: .green)
            SliderView(colorValue: $blueValue, textEntered: $blueValueEntered, sliderColor: .blue)
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    
                    if valueValid(redValueEntered) {
                        redValue = Double(redValueEntered)!
                        redValueEntered = ""
                    } else { redValueEntered = "" }
                    
                    if valueValid(greenValueEntered) {
                        greenValue = Double(greenValueEntered)!
                        greenValueEntered = ""
                    } else { greenValueEntered = "" }
                    
                    if valueValid(blueValueEntered) {
                        blueValue = Double(blueValueEntered)!
                        blueValueEntered = ""
                    } else { blueValueEntered = "" }
                    isInputActive = false
                }
            }
        }
    }
}
