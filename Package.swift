// swift-tools-version:4.0
import PackageDescription


let package = Package(
    name: "OutlawCoreGraphics",
    products: [
        .library(name: "OutlawCoreGraphics", targets: ["OutlawCoreGraphics"])
    ],
    dependencies: [
        .package(url: "https://github.com/Molbie/Outlaw.git", from: "4.0.0")
    ],
    targets: [
        .target(name: "OutlawCoreGraphics", dependencies: ["Outlaw"]),
        .testTarget(name: "OutlawCoreGraphicsTests", dependencies: ["OutlawCoreGraphics"])
    ]
)
