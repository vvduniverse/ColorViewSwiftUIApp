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
            SliderView(colorValue: $redValue, textEntered: $redValueEntered, sliderColor: .red)
            SliderView(colorValue: $greenValue, textEntered: $greenValueEntered, sliderColor: .green)
            SliderView(colorValue: $blueValue, textEntered: $blueValueEntered, sliderColor: .blue)
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

