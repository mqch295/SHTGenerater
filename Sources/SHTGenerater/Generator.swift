//
//  File.swift
//  
//
//  Created by Mqch on 2021/1/27.
//

import Foundation
import PathKit
import Stencil

public protocol Generator {
    init()
    func generate(arguments: [String], options: [String])
    static func help()
    static func singleLineUsage() -> String
}

extension Generator {
    var generatorName: String {
        return String(describing: type(of: self))
    }

    var basePath: Path {
        var bundlePath = Bundle.main.bundlePath.split(separator: "/")
        bundlePath.removeLast(2)
        let generatorsPath = bundlePath.joined(separator: "/")
        return Path("/\(generatorsPath)/Sources/SHTGenerater/Generators/")
    }

    var loader: FileSystemLoader {
        return FileSystemLoader(paths: [basePath])
    }

    var environment: Environment {
        return Environment(loader: loader)
    }
}
