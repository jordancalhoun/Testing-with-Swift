//
//  Converter.swift
//  TestingWithSwift
//
//  Created by Jordan Calhoun on 1/2/23.
//

import Foundation
struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        
        return celsius.value
    }
    
}
