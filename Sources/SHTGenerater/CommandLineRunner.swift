//
//  File.swift
//  
//
//  Created by Mqch on 2021/1/27.
//

import Foundation

public struct CommandLineRunner {
    public enum Command {
        case generate
        case help
        case unknown(name: String)

        init(name: String) {
            switch name.lowercased() {
            case "generate", "g": self = .generate
            case "help": self = .help
            default: self = .unknown(name: name)
            }
        }
    }

    public init(arguments: [String], options: [String]) throws {
        var arguments = arguments
        let options = options

        // No need for executable name
        arguments.removeFirst()

        guard !arguments.isEmpty else {
            throw CommandError.noCommand
        }

        let command = Command(name: arguments.removeFirst().lowercased())

        if options.contains("--verbose") {
            print("Command: \(command)")
            print("Arguments: \(arguments)")
            print("Options: \(options)")
            print()
        }

        switch command {
        case .generate:
            guard !arguments.isEmpty else { throw GeneratorCommandError.noGenerator }
            let generatorName = arguments.removeFirst()
            guard let generator = NSClassFromString(generatorName) as? Generator.Type else {
                throw GeneratorCommandError.unknownGenerator
            }

            if options.contains("-h") || options.contains("--help") {
                generator.help()
            } else {
                generator.init().generate(arguments: arguments, options: options)
            }

            Writer.finish()
        case .help:
            print("请联系APP研发部-iOS-孟庆成")
        case .unknown(let name):
            throw CommandError.unknownCommand(name: name)
        }
    }
}

extension CommandLineRunner {
    public enum CommandError: Error {
        case noCommand
        case unknownCommand(name: String)
    }

    public static func printCommandUsage() {
        print("Usage: SHTGenerater COMMAND")
        print()
        print("Commands:")
        print("  generate")
        print()
        print("Example:")
        print("  SHTGenerater generate")
    }
}

extension CommandLineRunner {
    public enum GeneratorCommandError: Error {
        case noGenerator
        case unknownGenerator
    }

    public static func printGeneratorUsage() {
        let generators: [Generator.Type] = [
            Module.self
        ]

        print("Usage: SHTGenerater generate GENERATOR")
        print()
        print("Generators:")
        for generator in generators {
            print("  \(generator.singleLineUsage())")
        }
        print()
        print("Example:")
        print("  SHTGenerater generate Module Order title:string artist_name:string album_name:string")
        print()
        print("Make sure to run generators inside of your project directory.")
    }
}
