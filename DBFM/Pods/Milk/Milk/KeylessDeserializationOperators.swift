//
//  KeylessDeserializationOperators.swift
//  Milk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation

/**
    Deserialize a `Serializable` value of type T.
*/
public prefix func <-<T: Serializable> (right: Serializer) -> T? {
    return right.deserializeValue()
}

/**
    Deserialize a collection of `Serializable` values.
*/
public prefix func <-<T: Serializable> (right: Serializer) -> [T]? {
    return right.deserializeValue()
}
