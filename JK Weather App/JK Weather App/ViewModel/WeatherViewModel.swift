//
//  WeatherViewModel.swift
//  JK Weather App
//
//  Created by Janak Khadka on 19/02/2025.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather? // Published property to update the view
    @Published var isLoading: Bool = false // loading state track garna
    @Published var errorMessage: String?
    
    private let networkManager = NetworkManager()
    
    func fetchWeather(for city: String) {
        isLoading = true
        errorMessage = nil
        
        networkManager.sendRequest(city: city) { [weak self] weather in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let weather = weather {
                    self?.weather = weather
                } else {
                    self?.errorMessage = "Failed to fetch weather data"
                }
            }
        }
    }
}
