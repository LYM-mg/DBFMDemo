//
//  JSONSerializer.swift
//  SwiftyJSONMilk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation
import Milk
import SwiftyJSON

public final class JSONSerializer: Serializer {

    // MARK: Public properties

    public private(set) var json: JSON

    // MARK: Object lifecycle

    public init() {
        self.json = [:]
    }

    public init(json: JSON) {
        self.json = json
    }

    // MARK: Public methods

    public static func fromData(data: NSData) throws -> JSONSerializer? {
        let json = JSON(data: data, options: NSJSONReadingOptions())
        return JSONSerializer(json: json)
    }

    public func toData() throws -> NSData? {
        return try json.rawData()
    }

    // MARK: Serialization

    public func serialize<T : Serializable>(value: T) {
        let serializer = JSONSerializer()
        value.serialize(serializer)
        json = serializer.json
    }

    public func serialize<T: Serializable>(value: T, forKeyPath keyPath: String) {
        let serializer = JSONSerializer()
        value.serialize(serializer)
        json[keyPath] = serializer.json
    }

    public func serialize(value: Bool, forKeyPath keyPath: String) {
        json[keyPath].boolValue = value
    }

    public func serialize(value: Int16, forKeyPath keyPath: String) {
        json[keyPath].int16Value = value
    }

    public func serialize(value: Int32, forKeyPath keyPath: String) {
        json[keyPath].int32Value = value
    }

    public func serialize(value: Int64, forKeyPath keyPath: String) {
        json[keyPath].int64Value = value
    }

    public func serialize(value: Int, forKeyPath keyPath: String) {
        json[keyPath].intValue = value
    }

    public func serialize(value: UInt16, forKeyPath keyPath: String) {
        json[keyPath].uInt16Value = value
    }

    public func serialize(value: UInt32, forKeyPath keyPath: String) {
        json[keyPath].uInt32Value = value
    }

    public func serialize(value: UInt64, forKeyPath keyPath: String) {
        json[keyPath].uInt64 = value
    }

    public func serialize(value: UInt, forKeyPath keyPath: String) {
        json[keyPath].uIntValue = value
    }

    public func serialize(value: Float, forKeyPath keyPath: String) {
        json[keyPath].floatValue = value
    }

    public func serialize(value: Double, forKeyPath keyPath: String) {
        json[keyPath].doubleValue = value
    }

    public func serialize(value: String, forKeyPath keyPath: String) {
        json[keyPath].stringValue = value
    }

    // MARK: Deserialization

    public func deserializeValue<T: Serializable>() -> T? {
        return T.deserialize(self)
    }

    public func deserializeValueForKeyPath<T: Serializable>(keyPath: String) -> T? {
        let deserializeValuer = JSONSerializer(json: json[keyPath])
        return T.deserialize(deserializeValuer)
    }

    public func deserializeValueForKeyPath(keyPath: String) -> Bool? {
        return json[keyPath].bool
    }

    public func deserializeValueForKeyPath(keyPath: String) -> Int16? {
        return json[keyPath].int16
    }

    public func deserializeValueForKeyPath(keyPath: String) -> Int32? {
        return json[keyPath].int32
    }

    public func deserializeValueForKeyPath(keyPath: String) -> Int64? {
        return json[keyPath].int64
    }

    public func deserializeValueForKeyPath(keyPath: String) -> Int? {
        return json[keyPath].int
    }

    public func deserializeValueForKeyPath(keyPath: String) -> UInt16? {
        return json[keyPath].uInt16
    }

    public func deserializeValueForKeyPath(keyPath: String) -> UInt32? {
        return json[keyPath].uInt32
    }

    public func deserializeValueForKeyPath(keyPath: String) -> UInt64? {
        return json[keyPath].uInt64
    }

    public func deserializeValueForKeyPath(keyPath: String) -> UInt? {
        return json[keyPath].uInt
    }

    public func deserializeValueForKeyPath(keyPath: String) -> Float? {
        return json[keyPath].float
    }

    public func deserializeValueForKeyPath(keyPath: String) -> Double? {
        return json[keyPath].double
    }

    public func deserializeValueForKeyPath(keyPath: String) -> String? {
        return json[keyPath].string
    }

    // MARK: Collections

    public func serialize<T: Serializable>(values: [T]) {
        let result = values.map { value -> JSON in
            let serializer = JSONSerializer()
            value.serialize(serializer)
            return serializer.json
        }
        json = JSON(result)
    }

    public func serialize<T: Serializable>(values: [T], forKeyPath keyPath: String) {
        let result = values.map { value -> JSON in
            let serializer = JSONSerializer()
            value.serialize(serializer)
            return serializer.json
        }

        json[keyPath] = JSON(result)
    }

    public func serialize(values: [Bool], forKeyPath keyPath: String) {
        json[keyPath] = JSON(values)
    }

    public func serialize(value: [Int16], forKeyPath keyPath: String) {
        json[keyPath].object as? [Int16]
    }

    public func serialize(value: [Int32], forKeyPath keyPath: String) {
        json[keyPath].object as? [Int32]
    }

    public func serialize(value: [Int64], forKeyPath keyPath: String) {
        json[keyPath].object as? [Int64]
    }

    public func serialize(value: [Int], forKeyPath keyPath: String) {
        json[keyPath].object as? [Int]
    }

    public func serialize(value: [UInt16], forKeyPath keyPath: String) {
        json[keyPath].object as? [UInt16]
    }

    public func serialize(value: [UInt32], forKeyPath keyPath: String) {
        json[keyPath].object as? [UInt32]
    }

    public func serialize(value: [UInt64], forKeyPath keyPath: String) {
        json[keyPath].object as? [UInt64]
    }

    public func serialize(value: [UInt], forKeyPath keyPath: String) {
        json[keyPath].object as? [UInt]
    }

    public func serialize(values: [Float], forKeyPath keyPath: String) {
        json[keyPath] = JSON(values)
    }

    public func serialize(values: [Double], forKeyPath keyPath: String) {
        json[keyPath] = JSON(values)
    }

    public func serialize(values: [String], forKeyPath keyPath: String) {
        json[keyPath] = JSON(values)
    }

    public func deserializeValue<T: Serializable>() -> [T]? {
        var deserializeValuedValues: [T]? = nil

        if let json = json.array {
            deserializeValuedValues = []
            for element in json {
                if let deserializeValuedValue: T = JSONSerializer(json: element).deserializeValue() {
                    deserializeValuedValues!.append(deserializeValuedValue)
                }
            }
        }

        return deserializeValuedValues
    }

    public func deserializeValueForKeyPath<T : Serializable>(keyPath: String) -> [T]? {
        return deserializeValueForKeyPath(keyPath) { element -> T? in
            return JSONSerializer(json: element).deserializeValue()
        }
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [Bool]? {
        return json[keyPath].object as? [Bool]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [Int16]? {
        return json[keyPath].object as? [Int16]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [Int32]? {
        return json[keyPath].object as? [Int32]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [Int64]? {
        return json[keyPath].object as? [Int64]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [Int]? {
        return json[keyPath].object as? [Int]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [UInt16]? {
        return json[keyPath].object as? [UInt16]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [UInt32]? {
        return json[keyPath].object as? [UInt32]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [UInt64]? {
        return json[keyPath].object as? [UInt64]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [UInt]? {
        return json[keyPath].object as? [UInt]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [Float]? {
        return json[keyPath].object as? [Float]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [Double]? {
        return json[keyPath].object as? [Double]
    }

    public func deserializeValueForKeyPath(keyPath: String) -> [String]? {
        return json[keyPath].object as? [String]
    }

    public func removeValueForKeyPath(keyPath: String) {
        json[keyPath] = nil
    }

    public func removeAllValues() {
        json = []
    }

    private func deserializeValueForKeyPath<T>(keyPath: String, map: (element: JSON) -> T?) -> [T]? {
        var deserializeValuedValues: [T]? = nil

        if let json = json[keyPath].array {
            deserializeValuedValues = []
            for element in json {
                if let deserializeValuedValue: T = map(element: element) {
                    deserializeValuedValues!.append(deserializeValuedValue)
                }
            }
        }
        
        return deserializeValuedValues
    }
}
