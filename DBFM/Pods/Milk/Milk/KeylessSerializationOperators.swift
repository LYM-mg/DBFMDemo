//
//  KeylessSerializationOperators.swift
//  Milk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation

/**
    Serialize any `Serializable` value.
*/
public func <-<T: Serializable>(left: Serializer, right: T) {
    left.serialize(right)
}

// MARK: Collections

/**
    Serialize any collection `Serializable` values.
*/
public func <-<T: Serializable>(left: Serializer, right: [T]) {
    left.serialize(right)
}

// MARK: Optionals

/**
    Serialize any optional `Serializable` value.
*/
public func <-<T: Serializable>(left: Serializer, right: T?) {
    left.serializeOptional(right)
}

// MARK: Optional collections

/**
    Serialize any optional collection of `Serializable` values.
*/
public func <-<T: Serializable>(left: Serializer, right: [T]?) {
    left.serializeOptional(right)
}
