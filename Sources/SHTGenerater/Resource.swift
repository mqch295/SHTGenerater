//
//  File.swift
//  
//
//  Created by Mqch on 2021/1/27.
//

import Foundation

struct Resource {
    var name: String
    var properties: [Property]?
    var nameForFunction: String

    init(name: String, properties: [Property]?) {
        self.name = name
        self.nameForFunction = self.name

        self.properties = properties
    }
}
struct Property: Equatable {
    public let name: String
    public var upperCamelCasedName: String
    public let valueType: String

    public var isCustomResource: Bool {
        return !Property.basicTypes.contains(valueType)
    }

    static var basicTypes = [
        "Bool",
        "Date",
        "Double",
        "Float",
        "Int",
        "String",
    ]

    private static var defaultValueType = "String"

    init(name: String, valueType: String?) {
        self.name = name
        self.upperCamelCasedName = self.name

        self.valueType = valueType ?? Property.defaultValueType
    }

    init?(input: String) {
        let splitStrings = input.split(separator: ":").map({ String($0) })
        guard let name = splitStrings.first else { return nil }
        self.init(name: name, valueType: splitStrings.count > 1 ? splitStrings[1] : nil)
    }

    static func createList(inputStrings: [String]) -> [Property] {
        return inputStrings.compactMap { Property(input: $0) }
    }
}
