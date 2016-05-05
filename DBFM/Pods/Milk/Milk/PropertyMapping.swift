//
//  PropertyMapping.swift
//  Milk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation

/**
    A utility class used for operator overloading.
*/
public struct PropertyMapping {
    let keyPath: String
    weak var serializer: Serializer?
}

public extension Serializer {
    /**
        Convienence method that enable a concise serialization and deserialization syntax.

        - parameter keyPath: The key path of the value to serialize or deserialize.

        - returns: A `PropertyMapping` object.
    */
    public subscript(keyPath: String) -> PropertyMapping {
        get {
            return PropertyMapping(keyPath: keyPath, serializer: self)
        }
    }
}
