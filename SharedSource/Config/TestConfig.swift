//
//  TestConfig.swift
//  TestE3Kit
//
//  Created by Yevhen Pyvovarov on 06.07.2022.
//

import Foundation

class TestConfig: Decodable {
    let KeychainGroup: String
    let ApiKeyId: String
    let ApiPrivateKey: String
    let AppId: String

    static func readFromBundle() -> TestConfig {
        let bundle = Bundle(for: self)
        let configFileUrl = bundle.url(forResource: "TestConfig", withExtension: "plist")!
        let data = try! Data(contentsOf: configFileUrl)

        return try! PropertyListDecoder().decode(TestConfig.self, from: data)
    }
}
