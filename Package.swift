// swift-tools-version:5.7

//
//  Package.swift
//  CryptomatorCloudAccess
//
//  Created by Philipp Schmid on 24.09.20.
//  Copyright © 2020 Skymatic GmbH. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "CryptomatorCloudAccess",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "CryptomatorCloudAccess", targets: ["CryptomatorCloudAccess"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/cryptomator/cryptolib-swift.git", .upToNextMinor(from: "1.1.0")
        ),
        .package(
            url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git",
            .upToNextMinor(from: "3.8.0")),
        .package(url: "https://github.com/groue/GRDB.swift.git", .upToNextMinor(from: "6.29.1")),
        .package(url: "https://github.com/tobihagemann/JOSESwift.git", exact: "2.4.1-cryptomator"),
        .package(url: "https://github.com/google/promises.git", exact: "2.3.1"),
    ],
    targets: [
        .target(
            name: "CryptomatorCloudAccess",
            dependencies: [
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .product(name: "CryptomatorCryptoLib", package: "cryptolib-swift"),
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "JOSESwift", package: "JOSESwift"),
                .product(name: "Promises", package: "promises"),
            ],
            path: "Sources/CryptomatorCloudAccess",
        ),
        .testTarget(
            name: "CryptomatorCloudAccessTests",
            dependencies: ["CryptomatorCloudAccess"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
