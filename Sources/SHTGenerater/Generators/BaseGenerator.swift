//
//  File.swift
//  
//
//  Created by Mqch on 2021/1/27.
//

import Foundation
import Stencil

class BaseGenerator: NSObject, Generator {
    required override init() {}

    private var generatorType: GeneratorType!
    convenience init(generatorType type: GeneratorType) {
        self.init()
        self.generatorType = type
    }
    func generate(arguments: [String], options: [String]) {
        guard !arguments.isEmpty else {
            type(of: self).help()
            exit(0)
        }

        var mutableArguments = arguments
        let resource = Resource(
            name: mutableArguments.removeFirst(),
            properties: Property.createList(inputStrings: mutableArguments)
        )
        let context: [String: Any] = [
            "resource": resource,
        ]

        let rendered = try! environment.renderTemplate(name: generatorType.templateName, context: context)

        Writer.createFile("\(resource.name)/\(generatorType.fileSuffixName)s/\(resource.name)\(generatorType.fileSuffixName).swift", contents: rendered, options: options)
    }

    static func help() {
        print("Usage: SHTGenerater generate \(singleLineUsage())")
        print()
        print("Example:")
        print("  SHTGenerater generate Module Order")
    }

    static func singleLineUsage() -> String {
        return "Module NAME [PROPERTY[:TYPE] PROPERTY[:TYPE]] …"
    }
}

