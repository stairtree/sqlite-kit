// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "sqlite-kit",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v13)
    ],
    products: [
        .library(name: "SQLiteKit", targets: ["SQLiteKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stairtree/sqlite-nio.git", .branch("master")),
        .package(url: "https://github.com/stairtree/sql-kit.git", .branch("master")),
        .package(url: "https://github.com/stairtree/async-kit.git", .branch("master")),
    ],
    targets: [
        .target(name: "SQLiteKit", dependencies: [
            .product(name: "AsyncKit", package: "async-kit"),
            .product(name: "SQLiteNIO", package: "sqlite-nio"),
            .product(name: "SQLKit", package: "sql-kit"),
        ]),
        .testTarget(name: "SQLiteKitTests", dependencies: [
            .product(name: "SQLKitBenchmark", package: "sql-kit"),
            .target(name: "SQLiteKit"),
        ]),
    ]
)
