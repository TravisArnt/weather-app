//
//  ContentView.swift
//  swiftUI-Weather
//
//  Created by Tint Htoo Ant on 4/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack(spacing: 10) {
                CityTextView(cityName: "Cupertino,CA")
                MainWeatherStatusView(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 80)
                HStack(spacing:10){
                    WeatherDayView(dayName: "Wed", systemName: "cloud.sun.rain.fill", temperature: 76)
                    WeatherDayView(dayName: "Thur", systemName: "cloud.sun.rain.fill", temperature: 76)
                    WeatherDayView(dayName: "Fri", systemName: "cloud.sun.rain.fill", temperature: 76)
                    WeatherDayView(dayName: "Sat", systemName: "cloud.sun.rain.fill", temperature: 76)
                    WeatherDayView(dayName: "Sun", systemName: "cloud.sun.rain.fill", temperature: 76)
                }
                
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time", foregroundColor:.white)
                }
                Spacer()
            }
        }
       
    }
}

#Preview {
    ContentView()
}


struct WeatherDayView: View {
    let dayName:String
    let systemName:String
    let temperature:Int
    var body: some View {
        VStack(alignment:.center){
            Text(dayName)
                .font(.system(size:20))
                .fontWeight(.medium)
                .foregroundColor(.white)
            Image(systemName: systemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:60,height:60)
            Text("\(temperature)°")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }
}


struct BackgroundView: View {
    var isNight:Bool
     
    var body: some View {
        LinearGradient(colors: [isNight ? .black: .blue,
                                isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    var systemName:String
    var temp:Int
    var body: some View {
        VStack {
            Image(systemName:systemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temp)°")
                .font(.system(size:70,weight:.medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,60)
    }
}

