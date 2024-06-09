//
//  TintColor.swift
//  ExpenseTrackerApp2
//
//  Created by Shivam Sultaniya on 08/06/24.
//

import SwiftUI

struct TintColor:Identifiable{
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .orange),
    .init(color: "Purple", value: .blue)
]
