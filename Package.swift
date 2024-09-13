// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkTest",
    platforms: [
      .iOS(.v13),
      .macOS(.v10_15),
      .tvOS(.v13),
      .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkTest",
            type: .dynamic,
            targets: ["NetworkTest"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0")  // Alamofire 추가
    ],
    targets: [
        .target(
            name: "NetworkTest",
            dependencies: ["Alamofire"]  // NetworkTest 타겟에 Alamofire 추가
        ),
        .testTarget(
            name: "NetworkTestTests",
            dependencies: ["NetworkTest"]),
    ]
)
