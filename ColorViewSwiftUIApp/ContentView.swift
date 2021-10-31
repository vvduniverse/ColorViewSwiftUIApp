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
