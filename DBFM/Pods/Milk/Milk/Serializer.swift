//
//  Serializer.swift
//  Milk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation

/**
    A format agonostic set of methods for serializing and deserializing fundamental
    types, collections and any type `T` that conforms to `Serializable`.

    Implementations are responsible for converting and storing the values in their
    desired format. e.g. A JSON dictionary.

    - note: Not all `Serializer` implementations have to support key paths. Some may just support a singular path "value".
*/
public protocol Serializer: class {

    // MARK: Serialization

    func serialize<T: Serializable>(value: T)
    func serialize<T: Serializable>(value: T, forKeyPath keyPath: String)
    func serialize(value: Bool, forKeyPath keyPath: String)
    func serialize(value: Int16, forKeyPath keyPath: String)
    func serialize(value: Int32, forKeyPath keyPath: String)
    func serialize(value: Int64, forKeyPath keyPath: String)
    func serialize(value: Int, forKeyPath keyPath: String)
    func serialize(value: UInt16, forKeyPath keyPath: String)
    func serialize(value: UInt32, forKeyPath keyPath: String)
    func serialize(value: UInt64, forKeyPath keyPath: String)
    func serialize(value: UInt, forKeyPath keyPath: String)
    func serialize(value: Float, forKeyPath keyPath: String)
    func serialize(value: Double, forKeyPath keyPath: String)
    func serialize(value: String, forKeyPath keyPath: String)

    // MARK: Deserialization

    func deserializeValue<T: Serializable>() -> T?
    func deserializeValueForKeyPath<T: Serializable>(keyPath: String) -> T?
    func deserializeValueForKeyPath(keyPath: String) -> Bool?
    func deserializeValueForKeyPath(keyPath: String) -> Int16?
    func deserializeValueForKeyPath(keyPath: String) -> Int32?
    func deserializeValueForKeyPath(keyPath: String) -> Int64?
    func deserializeValueForKeyPath(keyPath: String) -> Int?
    func deserializeValueForKeyPath(keyPath: String) -> UInt16?
    func deserializeValueForKeyPath(keyPath: String) -> UInt32?
    func deserializeValueForKeyPath(keyPath: String) -> UInt64?
    func deserializeValueForKeyPath(keyPath: String) -> UInt?
    func deserializeValueForKeyPath(keyPath: String) -> Float?
    func deserializeValueForKeyPath(keyPath: String) -> Double?
    func deserializeValueForKeyPath(keyPath: String) -> String?

    // MARK: Collections

    func serialize<T: Serializable>(values: [T])
    func serialize<T: Serializable>(values: [T], forKeyPath keyPath: String)
    func serialize(values: [Bool], forKeyPath keyPath: String)
    func serialize(values: [Int16], forKeyPath keyPath: String)
    func serialize(values: [Int32], forKeyPath keyPath: String)
    func serialize(values: [Int64], forKeyPath keyPath: String)
    func serialize(values: [Int], forKeyPath keyPath: String)
    func serialize(values: [UInt16], forKeyPath keyPath: String)
    func serialize(values: [UInt32], forKeyPath keyPath: String)
    func serialize(values: [UInt64], forKeyPath keyPath: String)
    func serialize(values: [UInt], forKeyPath keyPath: String)
    func serialize(values: [Float], forKeyPath keyPath: String)
    func serialize(values: [Double], forKeyPath keyPath: String)
    func serialize(values: [String], forKeyPath keyPath: String)

    func deserializeValue<T: Serializable>() -> [T]?
    func deserializeValueForKeyPath<T: Serializable>(keyPath: String) -> [T]?
    func deserializeValueForKeyPath(keyPath: String) -> [Bool]?
    func deserializeValueForKeyPath(keyPath: String) -> [Int16]?
    func deserializeValueForKeyPath(keyPath: String) -> [Int32]?
    func deserializeValueForKeyPath(keyPath: String) -> [Int64]?
    func deserializeValueForKeyPath(keyPath: String) -> [Int]?
    func deserializeValueForKeyPath(keyPath: String) -> [UInt16]?
    func deserializeValueForKeyPath(keyPath: String) -> [UInt32]?
    func deserializeValueForKeyPath(keyPath: String) -> [UInt64]?
    func deserializeValueForKeyPath(keyPath: String) -> [UInt]?
    func deserializeValueForKeyPath(keyPath: String) -> [Float]?
    func deserializeValueForKeyPath(keyPath: String) -> [Double]?
    func deserializeValueForKeyPath(keyPath: String) -> [String]?

    // MARK: Optionals

    func serializeOptional<T: Serializable>(value: T?)
    func serializeOptional<T: Serializable>(value: T?, forKeyPath keyPath: String)
    func serializeOptional(value: Bool?, forKeyPath keyPath: String)
    func serializeOptional(value: Int16?, forKeyPath keyPath: String)
    func serializeOptional(value: Int32?, forKeyPath keyPath: String)
    func serializeOptional(value: Int64?, forKeyPath keyPath: String)
    func serializeOptional(value: Int?, forKeyPath keyPath: String)
    func serializeOptional(value: UInt16?, forKeyPath keyPath: String)
    func serializeOptional(value: UInt32?, forKeyPath keyPath: String)
    func serializeOptional(value: UInt64?, forKeyPath keyPath: String)
    func serializeOptional(value: UInt?, forKeyPath keyPath: String)
    func serializeOptional(value: Float?, forKeyPath keyPath: String)
    func serializeOptional(value: Double?, forKeyPath keyPath: String)
    func serializeOptional(value: String?, forKeyPath keyPath: String)

    // MARK: Optional collections

    func serializeOptional<T: Serializable>(value: [T]?)
    func serializeOptional<T: Serializable>(value: [T]?, forKeyPath keyPath: String)
    func serializeOptional(value: [Bool]?, forKeyPath keyPath: String)
    func serializeOptional(value: [Int16]?, forKeyPath keyPath: String)
    func serializeOptional(value: [Int32]?, forKeyPath keyPath: String)
    func serializeOptional(value: [Int64]?, forKeyPath keyPath: String)
    func serializeOptional(value: [Int]?, forKeyPath keyPath: String)
    func serializeOptional(value: [UInt16]?, forKeyPath keyPath: String)
    func serializeOptional(value: [UInt32]?, forKeyPath keyPath: String)
    func serializeOptional(value: [UInt64]?, forKeyPath keyPath: String)
    func serializeOptional(value: [UInt]?, forKeyPath keyPath: String)
    func serializeOptional(value: [Float]?, forKeyPath keyPath: String)
    func serializeOptional(value: [Double]?, forKeyPath keyPath: String)
    func serializeOptional(value: [String]?, forKeyPath keyPath: String)

    /**
        Remove a single serialized value.

        - parameter keyPath: The key path of the value to remove. A key path is of the format "path.to.value"
    */
    func removeValueForKeyPath(keyPath: String)

    /**
        Remove all currently stored values.
    */
    func removeAllValues()

    /**
        Transforms the internal format to a binary representation.

        - returns: The NSData if the current format is valid and can be transformed. Alternatively this method can throw an error.
    */
    func toData() throws -> NSData?

    /**
        Transforms a binary representation of the format into a `Serializer` instance ready to deserialize objects.

        - parameter data: Data which must be in the same format as that returned from `toData()`.

        - returns: If the data is valid, a `Serializer` instance ready for deserialization. If the data is invalid an error can be thrown.
    */
    static func fromData(data: NSData) throws -> Self?

    /**
        A convienence method that enables a concise serialization and deserialization syntax.

        - parameter keyPath: The key path of the value to serialize or deserialize. A key path is of the format "path.to.value"

        - returns: A `PropertyMapping` object.
    */
    subscript(keyPath: String) -> PropertyMapping { get }
}
