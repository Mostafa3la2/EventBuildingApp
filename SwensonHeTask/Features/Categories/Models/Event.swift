//
//  Event.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import SwiftData

@Model
class Event {
    var avgBudget: Double?
    var minBudget: Double?
    var maxBudget: Double?
    var time: String?
    init(avgBudget: Double? = nil, minBudget: Double? = nil, maxBudget: Double? = nil, time: String? = nil) {
        self.avgBudget = avgBudget
        self.minBudget = minBudget
        self.maxBudget = maxBudget
        self.time = time
    }
}
