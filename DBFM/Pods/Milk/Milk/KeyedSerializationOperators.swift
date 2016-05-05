//
//  KeyedSerializationOperators.swift
//  Milk
//
//  Created by Jordan Hamill on 06/09/2015.
//  Copyright © 2015 JordanHamill. All rights reserved.
//

import Foundation

infix operator <- {}

public func <-<T: Serializable>(left: PropertyMapping, right: T) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Bool) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int16) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int32) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int64) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt16) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt32) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt64) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Float) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Double) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: String) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

// MARK: Collections

public func <-<T: Serializable>(left: PropertyMapping, right: [T]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Bool]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int16]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int32]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int64]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt16]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt32]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt64]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Float]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Double]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [String]) {
    left.serializer?.serialize(right, forKeyPath: left.keyPath)
}

// MARK: Optionals

public func <-<T: Serializable>(left: PropertyMapping, right: T?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Bool?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int16?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int32?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int64?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Int?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt16?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt32?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt64?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: UInt?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Float?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: Double?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: String?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

// MARK: Optional collections

public func <-<T: Serializable>(left: PropertyMapping, right: [T]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Bool]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int16]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int32]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int64]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Int]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt16]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt32]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt64]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [UInt]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Float]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [Double]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}

public func <- (left: PropertyMapping, right: [String]?) {
    left.serializer?.serializeOptional(right, forKeyPath: left.keyPath)
}
