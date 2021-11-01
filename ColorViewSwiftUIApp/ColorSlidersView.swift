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
    
    @State private var showingAlert = false
    
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
                HStack {
                    Spacer()
                    Button("Done") {
                        if valueValid(redValueEntered) {
                            redValue = Double(redValueEntered)!
                            redValueEntered = ""
                        } else {
                            redValueEntered = ""
                            showingAlert = true
                        }
                        
                        if valueValid(greenValueEntered) {
                            greenValue = Double(greenValueEntered)!
                            greenValueEntered = ""
                        } else {
                            greenValueEntered = ""
                            showingAlert = true
                        }
                        
                        if valueValid(blueValueEntered) {
                            blueValue = Double(blueValueEntered)!
                            blueValueEntered = ""
                        } else {
                            blueValueEntered = ""
                            showingAlert = true
                        }
                        isInputActive = false
                    }.alert(Text("Wrong data!"), isPresented: $showingAlert, actions: {})  {
                        Text("Please enter number from 0 to 255!")
                    }
                }
            }
        }
    }
}
