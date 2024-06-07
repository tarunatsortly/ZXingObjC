// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ZXingObjC",
    products: [
        .library(name: "ZXingObjC", targets: ["ZXingObjC"]),
    ],
    targets: [
        .target(
            name: "ZXingObjC",
            dependencies: [],
            path: "ZXingObjC",
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("aztec"),
                .headerSearchPath("core"),
                .headerSearchPath("core/reedsolomon"),
                .headerSearchPath("datamatrix"),
                .headerSearchPath("oned"),
                .headerSearchPath("pdf417"),
                .headerSearchPath("qrcode"),
            ]
        )
    ]
)
