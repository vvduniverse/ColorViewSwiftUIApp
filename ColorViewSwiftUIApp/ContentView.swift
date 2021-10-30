//
//  ContentView.swift
//  ColorViewSwiftUIApp
//
//  Created by Vahtee Boo on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSlider = Double.random(in: 0...1)
    @State private var greenSlider = Double.random(in: 0...1)
    @State private var blueSlider = Double.random(in: 0...1)
    
    var body: some View {
        VStack {
            Color(.init(red: redSlider, green: greenSlider, blue: blueSlider, alpha: 1.0))
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack {
                Text("Red: \(redSlider)")
                Text("Green: \(greenSlider)")
                Text("Blue: \(blueSlider)")
            }
            ColorSlidersView(redValue: $redSlider, greenValue: $greenSlider, blueValue: $blueSlider)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlidersView: View {
    
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("0")
                Slider(value: $redValue, in: 0...1, step: 1)
                    .accentColor(.red)
                Text("255")
            }
            HStack {
                Text("0")
                Slider(value: $greenValue, in: 0...1, step: 1)
                    .accentColor(.green)
                Text("255")
            }
            HStack {
                Text("0")
                Slider(value: $blueValue, in: 0...1, step: 1)
                Text("255")
            }
        }
//        .frame(height: 250)
    }
}
