//
//  SliderView.swift
//  ColorViewSwiftUIApp
//
//  Created by Vahtee Boo on 31.10.2021.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var colorValue: Double
    @Binding var textEntered: String
    
    @FocusState var activeInput: Bool
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Slider(value: $colorValue, in: 0...255, step: 1)
                .accentColor(sliderColor)
            TextField("\(lround(colorValue))", text: $textEntered)
                .textFieldStyle(.roundedBorder)
                .focused($activeInput)
                .keyboardType(.numberPad)
                .frame(width: 45)
        }
    }
}


