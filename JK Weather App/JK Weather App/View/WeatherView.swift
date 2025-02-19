//
//  WeatherView.swift
//  JK Weather App
//
//  Created by Janak Khadka on 18/02/2025.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()

    @State private var searchText: String = "Kathmandu"
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    //top ko card
                    WeatherCard(viewModel: viewModel, geometry: geometry)
                    
                    HStack{
                        Text("Weather Status")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top, 30)
                            .padding(.leading)
                            .padding(.bottom, 10)
                        Spacer()
                    }
                    
                    
                    // talako baki info/stats
                    WeatherStats(viewModel: viewModel)
                }
                .background(.gray.opacity(0.2))
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            viewModel.fetchWeather(for: searchText) //suruma load huda ko l lagi
        }
    }
}

// top weather card
struct WeatherCard: View {
    @ObservedObject var viewModel: WeatherViewModel
    let geometry: GeometryProxy
    @State private var searchTextField: String = ""
    @State private var searchText: String = "Kathmandu"
    @State private var isSearching: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .fill(Color(red: 138/255, green: 43/255, blue: 226/255))
            .frame(height: geometry.size.height / 2.5)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(Color.white.opacity(0.3))
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .overlay(
                        VStack {
                            HStack {
                                Text("RIGHT NOW")
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.top)
                            
                            Spacer()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    if let weather = viewModel.weather {
                                        Text("\(Int(weather.temperature))°C")
                                            .font(.system(size: 55, weight: .bold))
                                            .padding(.leading)
                                        
                                        Text(weather.condition)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.leading)
                                    } else {
                                        ProgressView()
                                            .padding()
                                    }
                                }
                                
                                Spacer()
                                
                                //condition anusarko icon
                                if let weather = viewModel.weather {
                                    Image(systemName: weather.conditionIcon)
                                        .foregroundColor(weather.conditionIcon == "sun.max.fill" ? .yellow : .white)
                                        .font(.system(size: 68, weight: .bold))
                                        .padding(.trailing)
                                }
                            }
                            
                            Spacer()
                            
                            // Search Bar
                            SearchBar(isSearching: $isSearching, searchTextField: $searchTextField, searchText: $searchText, viewModel: viewModel)
                        }
                    )
                    .padding(.top, 50)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 10)
            )
    }
}

// Search Bar logic
struct SearchBar: View {
    @Binding var isSearching: Bool
    @Binding var searchTextField: String
    @Binding var searchText: String
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        HStack {
            if !isSearching {
                if let country = viewModel.weather?.country {
                    Text("\(viewModel.weather?.city ?? searchText), \(country)")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading)
                        .opacity(0.6)
                        .frame(height: 40)
                }
            } else {
                TextField("Search a location...", text: $searchTextField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(.opacity(0))
                    .frame(height: 40)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button(action: {
                if isSearching {
                    searchText = searchTextField
                    viewModel.fetchWeather(for: searchTextField)
                } else {
                    searchTextField = ""
                }
                isSearching.toggle()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .font(.system(size: 25, weight: .bold))
            }
        }
        Spacer()
    }
}

// other-info talako
struct WeatherStats: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                if let weather = viewModel.weather {
                    Text("\(Int(weather.temp_min))°C")
                        .font(.system(size: 55, weight: .bold))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Text("\(Int(weather.temp_max))°C")
                        .font(.system(size: 55, weight: .bold))
                        .padding(.leading)
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("LOW")
                    .font(.system(size: 20, weight: .bold))
                    .opacity(0.5)
                
                Spacer()
                Spacer()
                
                Text("HIGH")
                    .font(.system(size: 20, weight: .bold))
                    .opacity(0.5)
                
                Spacer()
            }
            .padding(.bottom, 20)
            
            VStack {
                Divider()
                WeatherStatRow(icon: "humidity", label: "HUMIDITY", value: "\(viewModel.weather?.humidity ?? 0)%")
                Divider()
                WeatherStatRow(icon: "wind", label: "WIND", value: "\(viewModel.weather?.wind ?? 0) MPH")
                Divider()
                WeatherStatRow(icon: "arrow.down", label: "PRESSURE", value: "\(viewModel.weather?.pressure ?? 0) hPa")
                Divider()
                WeatherStatRow(icon: "eye", label: "VISIBILITY", value: "\((viewModel.weather?.visibility ?? 0) / 1000) km")
            }
            .padding(.horizontal)
            
        }
        .padding(.top)
        .background(.white)
    }
}

//each info lai simplified gareko
struct WeatherStatRow: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 25))
                    .frame(width: 40)
                
                Text(label)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 5)
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 15, weight: .bold))
                .opacity(0.8)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    WeatherView()
}
