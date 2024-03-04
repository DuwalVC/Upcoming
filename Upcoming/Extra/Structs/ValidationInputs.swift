//
//  ValidationInputs.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

enum EvaluateError: Error {
    case isEmpty
    case isNotValidEmailAddress
    case isNotValidTextLength
    case isNotValidSpecialCharacter
    case isNotValidContainsNumbers
}

struct Validations {
    
    static func user(_ text: String) throws {
        if text.isEmpty {
            throw EvaluateError.isEmpty
        }

        if !containsMayuscule(text) {
            throw EvaluateError.isNotValidEmailAddress
        }

        if !minLength(text, min: 5) {
            throw EvaluateError.isNotValidTextLength
        }
    }
    
    static func password(_ text: String) throws {
        if text.isEmpty {
            throw EvaluateError.isEmpty
        }

        if !containsMayuscule(text) {
            throw EvaluateError.isNotValidEmailAddress
        }

        if !minLength(text, min: 12) {
            throw EvaluateError.isNotValidTextLength
        }
        
        if !containsSpecialCharacter(text) {
            throw EvaluateError.isNotValidSpecialCharacter
        }
        
        if !containsNumbers(text) {
            throw EvaluateError.isNotValidContainsNumbers
        }
    }
    
    static func minLength(_ text: String, min: Int) -> Bool {
        return text.count >= min
    }
    
    static func containsMayuscule(_ text: String) -> Bool {
        return text.contains { $0.isUppercase }
    }
    
    static func containsSpecialCharacter(_ text: String) -> Bool {
        let specialCharacterRegex = "^[^\\W_]+$"
        let specialCharacterTest = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegex)
        return !specialCharacterTest.evaluate(with: text)
    }
    
    private static func containsNumbers(_ text: String) -> Bool {
        let numbersRegex = "^[^0-9]*$"
        let numbersTest = NSPredicate(format:"SELF MATCHES %@", numbersRegex)
        return !numbersTest.evaluate(with: text)
    }
}
