import XCTest
@testable import MyLibrary

final class IntegerationTests: XCTestCase {

    func testWeatherServiceTempIsPleasant() async throws {
        // Given
        let service_obj = WeatherServiceImpl()

        // When
        let temperature = try await service_obj.getTemperature()

        // Then
        XCTAssertNotNil(temperature)


        // Checking if the Temprature returned by the WeatherService is Pleasent, I like when temp is below 70 :)
        XCTAssertLessThanOrEqual(temperature,70)

    }

}
