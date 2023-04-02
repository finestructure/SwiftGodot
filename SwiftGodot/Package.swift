// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGodot",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftGodot",
            type: .dynamic,
            targets: ["SwiftGodot"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GDExtension"),
            //exclude: ["include/README.md"]),
        .target(
            name: "SwiftGodot",
            dependencies: ["GDExtension"],
            swiftSettings: [.unsafeFlags (["-suppress-warnings"])],
            linkerSettings: [.unsafeFlags (
                ["-Xlinker", "-undefined",
                 "-Xlinker", "dynamic_lookup",
                 
                 "-Xlinker", "-mark_dead_strippable_dylib",
                 
//                 // This one is just to experiment for now
//                 // Probably need to try the -why_live SYMBOL
//                 "-Xlinker", "-dead_strip_dylibs",
//                 "-Xlinker", "-why_live",
//                 "-Xlinker", "_$s10SwiftGodot013AnimationNodeC0C8PlayModeOMf"
                ])
            ]),
        
        // Idea: -mark_dead_strippable_dylib
        .testTarget(
            name: "SwiftGodotTests",
            dependencies: ["SwiftGodot"]),
    ]
)
