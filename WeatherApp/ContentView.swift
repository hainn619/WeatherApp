//
//  ContentView.swift
//  WeatherApp
//
//  Created by Hai Ng on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack { 
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 76)
                .padding(.bottom, 40)
                HStack(spacing: 20){
                    WeatherDayView(
                        dayofweek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 76)
                    WeatherDayView(
                        dayofweek: "WED",
                        imageName: "cloud.fill",
                        temperature: 76)
                    WeatherDayView(
                        dayofweek: "THU",
                        imageName: "cloud.rain.fill",
                        temperature: 76)
                    WeatherDayView(
                        dayofweek: "FRI",
                        imageName: "wind.snow",
                        temperature: 76)
                    WeatherDayView(
                        dayofweek: "SAT",
                        imageName: "cloud.sun.fill",
                        temperature: 76)
                }
                Spacer()
               
                Button{
                    
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonName: "Change Day Time", 
                                  textColor: .blue,
                                  backgroundColor: .white)
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
    var dayofweek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(dayofweek)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size:28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
        
    //    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, //isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, //endPoint: .bottomTrailing)
     //       .edgesIgnoringSafeArea(.all)
    }
}
struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 5){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°").font(.system(size: 70, weight: .bold)).foregroundColor(.white)
        }
    }
}
