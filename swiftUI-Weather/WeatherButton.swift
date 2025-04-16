//
//  WeatherButton.swift
//  swiftUI-Weather
//
//  Created by Tint Htoo Ant on 4/15/25.
//

import Foundation
import SwiftUI

struct WeatherButton:View{
    var buttonText:String;
    var foregroundColor:Color
    
    var body: some View{
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 280,height:50)
            .foregroundColor(foregroundColor)
            .overlay(Text(buttonText)
                .font(.system(size:20,weight: .bold,design: .default)))
    }
}


