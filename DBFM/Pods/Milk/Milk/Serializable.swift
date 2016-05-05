//
//  Serializable.swift
//  Milk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation

/**
    Any type that is to be serialized by `Serializer` must conform
    to `Serializable`.
*/
public protocol Serializable {
    /**
        Serializes `self` in the format specified by `serializer`.

        - parameter serializer: A container for the serialized data in a specific format.
    */
    func serialize(serializer: Serializer)

    /**
        Deserialize and construct an instance of `Self` from the data contained in `deserializer`.

        - parameter deserializer: The serialized data used for deserialization.

        - returns: A new instance of `Self` if deserialization was successful.
    */
    static func deserialize(deserializer: Serializer) -> Self?
}
