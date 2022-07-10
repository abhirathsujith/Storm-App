//
//  WeatherView.swift
//  Storm
//
//  Created by Abhirath Sujith on 09/07/22.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            
            VStack{
                
                VStack (alignment: .leading, spacing: 5) {
                    
                    Text(weather.name).bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 50))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame( height: 80)
                    
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                    
                    
                    
                .frame(maxWidth: .infinity)

                
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 21) {
                    Text("Weather Near You")
                        .bold().padding(.bottom)
                        .foregroundColor(Color(red: 0.03137254901960784, green: 0.054901960784313725, blue: 0.17254901960784313))
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°" ))
                            .foregroundColor(Color(red: 0.1450980392156863, green: 0.4549019607843137, blue: 0.6627450980392157))
                        
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max Temp   ", value: (weather.main.tempMax.roundDouble() + "°" ))
                            .foregroundColor(Color(red: 0.9647058823529412, green: 0.2784313725490196, blue: 0.2784313725490196))
                    }
                    
                    HStack{
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%" ))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s" ))
                            .foregroundColor(Color(red: 0.00392156862745098, green: 0.00392156862745098, blue: 0.47843137254901963))
                    }

                }
                .frame( maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.066, saturation: 1.0, brightness: 1.0))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 0.34901960784313724, green: 0.6705882352941176, blue: 0.8901960784313725))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
