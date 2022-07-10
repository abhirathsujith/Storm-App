//
//  ContentView.swift
//  Storm
//
//  Created by Abhirath Sujith on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else {
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading{
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
           
        }
        .background(Color(red: 0.8941176470588236, green: 0.9450980392156862, blue: 0.996078431372549))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
