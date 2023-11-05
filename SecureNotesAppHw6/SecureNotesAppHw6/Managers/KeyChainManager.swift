//
//  KeyChainManager.swift
//  SecureNotesAppHw6
//
//  Created by Andria Inasaridze on 05.11.23.
//

import Foundation
//import Security

class KeychainManager {

    // Singleton instance
    static let shared = KeychainManager()
    
    private let service = "app_service"

    private init() {}

    enum KeyChainError: Error {
        case sameItemFound
        case unknown
        case noSuchDataFound
        case KCErrorWithCode(Int)
    }

    // SAVE data
    func save(username: String, password: String) throws {
        
        guard let passwordData = password.data(using: .utf8) else {
            throw KeyChainError.unknown
        }

        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: username as AnyObject,
            kSecValueData as String: passwordData as AnyObject,
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }

        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }

        print("Saved username and password")
    }

    // GET password
    func getPassword(username: String) -> String? {
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: username as AnyObject,
            kSecReturnData as String: kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess, let passwordData = result as? Data else {
            return nil
        }

        return String(data: passwordData, encoding: .utf8)
    }

    // DELETE username and password
    func delete(username: String) throws {
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: username as AnyObject,
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeyChainError.KCErrorWithCode(Int(status))
        }
    }
}
