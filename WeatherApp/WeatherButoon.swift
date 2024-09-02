//
//  WeatherButoon.swift
//  WeatherApp
//
//  Created by Hai Ng on 9/1/24.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var buttonName: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(buttonName)
       
        .frame(width: 280, height: 50)
        .background(backgroundColor)
        .foregroundColor(textColor)
        .font(.system(size: 20, weight: .bold, design: .default))
        .cornerRadius(15)
    }
}

struct WeatherButoon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(buttonName: "Click here!", textColor: .white, backgroundColor: .blue)
    }
}
