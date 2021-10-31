//
//  ContentView.swift
//  ColorViewSwiftUIApp
//
//  Created by Vahtee Boo on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSlider = Double.random(in: 0...255)
    @State private var greenSlider = Double.random(in: 0...255)
    @State private var blueSlider = Double.random(in: 0...255)
    
    @State private var redValueC = ""
    @State private var greenValueC = ""
    @State private var blueValueC = ""
    
    
    var body: some View {
        
        VStack {
            Color(.init(red: redSlider/255, green: greenSlider/255, blue: blueSlider/255, alpha: 1.0))
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack {
                Text("Red: \(lround(redSlider))")
                Text("Green: \(lround(greenSlider))")
                Text("Blue: \(lround(blueSlider))")
            }
            ColorSlidersView(redValue: $redSlider, greenValue: $greenSlider, blueValue: $blueSlider, redValueT: $redValueC, greenValueT: $greenValueC, blueValueT: $blueValueC)
            
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
    
    @Binding var redValueT: String
    @Binding var greenValueT: String
    @Binding var blueValueT: String
    
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("\(lround(redValue))")
                Slider(value: $redValue, in: 0...255, step: 1)
                    .accentColor(.red)
                TextField("255", text: $redValueT)
                    .frame(width: 30)
            }
            HStack {
                Text("\(lround(greenValue))")
                Slider(value: $greenValue, in: 0...255, step: 1)
                    .accentColor(.green)
                TextField("255", text: $greenValueT)
                    .frame(width: 30)
            }
            HStack {
                Text("\(lround(blueValue))")
                Slider(value: $blueValue, in: 0...255, step: 1)
                TextField("255", text: $blueValueT)
                    .frame(width: 30)
            }
        }
    }
}
