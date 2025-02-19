import Foundation

class NetworkManager {
    private let apiKey = "9b1264154514797ff6e360d6a8f8518a"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func sendRequest(city: String, completion: @escaping (Weather?) -> Void) {
        // Construct the API URL correctly
        let apiURL = "\(baseURL)?q=\(city)&APPID=\(apiKey)&units=metric" // units=metrics le chai celcius maa dinxa
        guard let url = URL(string: apiURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received!")
                completion(nil)
                return
            }
            
            // raw response prinnt gareko
            if let rawResponse = String(data: data, encoding: .utf8) {
                print("Raw Response: \(rawResponse)")
            }
            
            // Parse JSON response
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Parsed JSON: \(json)")
                    
                    //city vetayena vane
                    if let cod = json["cod"] as? String, cod != "200" {
                        let weather = Weather(
                            country: "N/A",
                            city: "Not Found",
                            condition: "N/A",
                            temperature: 0.0,
                            temp_min: 0.0,
                            temp_max: 0.0,
                            pressure: 0.0,
                            humidity: 0.0,
                            visibility: 0.0,
                            wind: 0.0,
                            seaLevel: 0.0
                        )
                        completion(weather)
                        return
                    }
                    // Extract required data from JSON
                    if let main = json["main"] as? [String: Any],
                       let weatherArray = json["weather"] as? [[String: Any]],
                       let sys = json["sys"] as? [String: Any],
                       let wind = json["wind"] as? [String: Any],
                       let visibility = json["visibility"] as? Int,
                       let name = json["name"] as? String {
                        
                        // Extract weather condition
                        let condition = weatherArray.first?["description"] as? String ?? "N/A"
                        
                        // Create Weather object
                        let weather = Weather(
                            country: sys["country"] as? String ?? "N/A",
                            city: name,
                            condition: condition,
                            temperature: main["temp"] as? Double ?? 0.0,
                            temp_min: main["temp_min"] as? Double ?? 0.0,
                            temp_max: main["temp_max"] as? Double ?? 0.0,
                            pressure: main["pressure"] as? Double ?? 0.0,
                            humidity: main["humidity"] as? Double ?? 0.0,
                            visibility: Double(visibility),
                            wind: wind["speed"] as? Double ?? 0.0,
                            seaLevel: main["sea_level"] as? Double ?? 0.0
                        )
                        
                        completion(weather)
                    } else {
                        print("Failed to parse required fields from JSON")
                        completion(nil)
                    }
                }
            } catch {
                print("JSON parsing error: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
