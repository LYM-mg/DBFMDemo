//
//  Optionals.swift
//  Milk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation

public extension Serializer {

    public func serializeOptional<T: Serializable>(value: T?) {
        if let value = value {
            serialize(value)
        } else {
            removeAllValues()
        }
    }

    public func serializeOptional<T: Serializable>(value: T?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: Bool?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: Int16?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: Int32?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: Int64?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: Int?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: UInt16?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: UInt32?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: UInt64?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: UInt?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: Float?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: Double?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: String?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    // MARK: Collections

    public func serializeOptional<T: Serializable>(value: [T]?) {
        if let value = value {
            serialize(value)
        } else {
            removeAllValues()
        }
    }

    public func serializeOptional<T: Serializable>(value: [T]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [Bool]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [Int16]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [Int32]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [Int64]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [Int]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [UInt16]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [UInt32]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [UInt64]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [UInt]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [Float]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [Double]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }

    public func serializeOptional(value: [String]?, forKeyPath keyPath: String) {
        if let value = value {
            serialize(value, forKeyPath: keyPath)
        } else {
            removeValueForKeyPath(keyPath)
        }
    }
}
