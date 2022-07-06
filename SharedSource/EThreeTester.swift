//
//  EThreeTester.swift
//  TestE3Kit
//
//  Created by Yevhen Pyvovarov on 06.07.2022.
//

import Foundation
import VirgilE3Kit
import VirgilSDK

class EThreeTester {

    private let ethree: EThree
    private let config = TestConfig.readFromBundle()

    init() {
        let identity = "testIdentity"
        let params = EThreeParams(identity: identity, tokenCallback: { completion in
            let token = TokenGenerator().getTokenString(identity: identity)
            completion(token, nil)
        })
        params.storageParams = try! KeychainStorageParams.makeKeychainStorageParams(appName: self.config.KeychainGroup)

        self.ethree = try! EThree(params: params)
    }

    func initUser() {
        try! self.ethree.register().startSync().get()
    }

    func hasPrivateKey() -> Bool {
        try! self.ethree.hasLocalPrivateKey()
    }
}
