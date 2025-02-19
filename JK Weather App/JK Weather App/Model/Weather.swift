
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
        case "clear sky":
            return "sun.max.fill"
        case "clear":
            return "sun.max.fill"
        case "few clouds":
            return "cloud.fill"
        case "clouds":
            return "cloud.fill"
        case "broken clouds":
            return "cloud.fill"
        case "overcast clouds":
            return "cloud.fill"
        case "scattered clouds":
            return "cloud.fill"
        case "rain":
            return "cloud.rain.fill"
        case "thunder storm":
            return "cloud.bolt.fill"
        case "snow":
            return "snow"
        case "haze":
            return "cloud.fog.fill"
        default:
            return "questionmark.circle"
        }
    }
}
