
//
//  Model.swift
//  JK Weather App
//
//  Created by Janak Khadka on 19/02/2025.
//
import Foundation

struct Weather: Identifiable {
    let id = UUID()
    let country: String
    let city: String
    let condition: String
    let temperature: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
    let visibility: Double
    let wind: Double
    let seaLevel: Double
    
    var conditionIcon: String {
        switch condition.lowercased() {
        case "clear":
            return "sun.max.fill"
        case "clouds":
            return "cloud.fill"
        case "rain":
            return "cloud.rain.fill"
        case "thunderstorm":
            return "cloud.bolt.fill"
        case "snow":
            return "snow"
        default:
            return "questionmark.circle"
        }
    }
}
