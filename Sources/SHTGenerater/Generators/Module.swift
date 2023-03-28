//
//  File.swift
//  
//
//  Created by Mqch on 2021/1/27.
//

import Foundation
import Stencil
@objc(Module)
class Module: NSObject, Generator {
    required override init() {}

    func generate(arguments: [String], options: [String]) {
        guard !arguments.isEmpty else {
            type(of: self).help()
            exit(0)
        }
        let containsIGListKit = options.contains("-ig") || options.contains("--iglistkit")

        if containsIGListKit {
            BaseGenerator(generatorType: .igViewController).generate(arguments: arguments, options: options)
            BaseGenerator(generatorType: .sectionController).generate(arguments: arguments, options: options)
            BaseGenerator(generatorType: .igCell).generate(arguments: arguments, options: options)
            BaseGenerator(generatorType: .igModel).generate(arguments: arguments, options: options)
        }else{
            BaseGenerator(generatorType: .viewController).generate(arguments: arguments, options: options)
            BaseGenerator(generatorType: .cell).generate(arguments: arguments, options: options)
            BaseGenerator(generatorType: .model).generate(arguments: arguments, options: options)
        }
        BaseGenerator(generatorType: .viewModel).generate(arguments: arguments, options: options)
    }

    static func help() {
        print("Usage: SHTGenerater generate \(singleLineUsage())")
        print()
        print("Example:")
        print("  SHTGenerater generate Module Order -ig")
    }

    static func singleLineUsage() -> String {
        return "Module NAME -OPTION"
    }
}
