//
//  Hater.swift
//  TestingWithSwift
//
//  Created by Jordan Calhoun on 12/29/22.
//

import Foundation
struct Hater {
    var hating = false
    mutating func hadABadDay() {
        hating = true
    }
    mutating func hadAGoodDay() {
        hating = false
    }
    
}
