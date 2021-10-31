//
//  HideKeyboard.swift
//  ColorViewSwiftUIApp
//
//  Created by Vahtee Boo on 31.10.2021.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
