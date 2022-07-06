//
//  FakeTokenGenerator.swift
//  TestE3Kit
//
//  Created by Yevhen Pyvovarov on 06.07.2022.
//

import Foundation
import VirgilCrypto
import VirgilSDK

class TokenGenerator {
    private let config = TestConfig.readFromBundle()
    private let crypto = try! VirgilCrypto()

    func getTokenString(identity: String) -> String {
        let jwt = self.getToken(identity: identity, ttl: 1000)

        return jwt.stringRepresentation()
    }

    private func getToken(identity: String, ttl: TimeInterval = 1000) -> Jwt {
        let privateKeyData = Data(base64Encoded: self.config.ApiPrivateKey)
        let keyPair = try! self.crypto.importPrivateKey(from: privateKeyData!)

        let generator = try! JwtGenerator(apiKey: keyPair.privateKey,
                                          apiPublicKeyIdentifier: self.config.ApiKeyId,
                                          crypto: self.crypto,
                                          appId: self.config.AppId,
                                          ttl: ttl)

        let jwt = try! generator.generateToken(identity: identity)

        return jwt
    }
}
