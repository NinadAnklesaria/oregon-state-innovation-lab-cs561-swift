import Alamofire

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

enum BaseUrl :String {
    case openweathermapApi = "https://api.openweathermap.org/data/2.5/weather"
    case mockServer = "http://localhost:8000/data/2.5/weather"
}

class WeatherServiceImpl: WeatherService {

    //let url_enum = BaseUrl.openweathermapApi.rawValue
    //let uri = "?lat=44.5645&lon=-123.2620&appid=e6e0697dd92a6121ea1154bc10b99d02"
    //let url = url_enum + "?lat=44.5645&lon=-123.2620&appid=e6e0697dd92a6121ea1154bc10b99d02"
    
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.5645&lon=-123.2620&appid=e6e0697dd92a6121ea1154bc10b99d02"

    func getTemperature() async throws -> Int {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                case let .success(weather):
                    let temperature = weather.main.temp
                    let temperatureAsInteger = Int(temperature)
                    continuation.resume(with: .success(temperatureAsInteger))

                case let .failure(error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

public struct Weather: Decodable {
    public let main: Main

    public struct Main: Decodable {
        public let temp: Double
    }
}
