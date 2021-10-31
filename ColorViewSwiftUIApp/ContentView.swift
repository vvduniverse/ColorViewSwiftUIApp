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
    
        @State private var redValueC = ""
        @State private var greenValueC = ""
        @State private var blueValueC = ""
//    @State private var redValue = Text("\(redSlider)")
//    @State private var greenValue = Double.random(in: 0...1)
//    @State private var blueValue = Double.random(in: 0...1)
    
    var body: some View {
//        var redValue = Text("\(redSlider)")
        VStack {
            Color(.init(red: redSlider, green: greenSlider, blue: blueSlider, alpha: 1.0))
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack {
                Text("Red: \(lround(redSlider * 100))")
                Text("Green: \(lround(greenSlider * 100))")
                Text("Blue: \(lround(blueSlider * 100))")
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
    
//    @State private  var redValueT: String
//    @State private var greenValueT: String
//    @State private var blueValueT: String
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("\(lround(redValue * 100))")
                Slider(value: $redValue, in: 0...1)
//                Slider(value: $redValue, in: 0...1, step: 1)
                    .accentColor(.red)
                TextField("255", text: $redValueT)
                    .frame(width: 30)
            }
            HStack {
                Text("\(lround(greenValue * 100))")
                Slider(value: $greenValue, in: 0...1)
//                Slider(value: $greenValue, in: 0...1, step: 1)
                    .accentColor(.green)
                TextField("255", text: $greenValueT)
                    .frame(width: 30)
            }
            HStack {
                Text("\(lround(blueValue * 100))")
                Slider(value: $blueValue, in: 0...1)
//                Slider(value: $blueValue, in: 0...1, step: 1)
                TextField("255", text: $blueValueT)
                    .frame(width: 30)
//                    .border(<#_#>, width: 30)
//                    .border(RoundedRectangle(), width: 30)
//                    .clipShape(RoundedRectangle(cornerRadius: 4))
//                    .background(.red)
                    
            }
        }
//        .frame(height: 250)
    }
}
