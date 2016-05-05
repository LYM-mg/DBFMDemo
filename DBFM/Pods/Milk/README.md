# <img src="milk.png" width="48"> Milk

Milk for your Swift serialization - A common set of simple interfaces and operators for implementing serialization in Swift.

The interfaces provided by Milk allow you to serialize both `class` and `struct` types. Properties can be both immutable (`let`) and mutable (`var`) without having to use implicit unwraping `!`.

Milk is meant to be format agnostic, providing an interface just as capable of serializing to JSON as it is to binary. For the sake of documentation, most of the examples given here will refer to serializing to and from JSON.

*Note: Milk requires Swift 2.0 as it uses protocol extensions to provide default implementations of common methods.*

### Example

```swift

struct Person {
    let name: String
    let age: Int
    let height: Float

    init(age: Int, name: String, height: height) {
        self.name = name
        self.age = age
        self.height = height
    }
}

extension Person: Serializable {
    private init?(name: String?, age: Int?, height: Float?) {
        if let name = name, age = age, height = height {
            self.name = name
            self.age = age
            self.height = height
        } else {
            return nil
        }
    }

    func serialize(serializer: Serializer) {
        serializer["name"] <- name
        serializer["age"] <- age
        serializer["height"] <- height
    }

    static func deserialize(deserializer: Serializer) -> Person? {
        return Person(name:   <-deserializer["name"],
                      age:    <-deserializer["age"],
                      height: <-deserializer["height"])
    }
}
```

```swift
let jsonSerializer: Serializer = JSONSerializer()
let person: Person = Person(name: "Matt", age: 12, height: 71.2)
person.serialize(jsonSerializer)

if let data = try jsonSerializer.toData() {
    ...
}
```

[SwiftyJSONMilk](https://github.com/jordanhamill/SwiftyJSONMilk) is a JSON serializer implementation which uses [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) under the hood. This can be used as is or as a reference implementation for other serializers.

## Installation

### CocoaPods

Add the following to your `Podfile`

```ruby
use_frameworks!

pod 'Milk'
```
### Carthage

Add the following to your `Cartfile`

```ruby
github "jordanhamill/Milk"
```


## Usage
### Operators

As you may have noticed in the above example, Milk provides several prefix and infix operators for convenience. These provide a less verbose way of using a `Serializer`.

Rather than typing out

```swift
let age: Int? = 12
serializer.serializeOptional(age, forKeyPath: "age")
```

You can use
```swift
serializer["age"] <- age
```
 Neat, eh?

And for deserialization:
```swift
let age: Int? = deserializer.deserializeValueForKeyPath("age")
//vs
let age: Int? = <-deserializer["age"]
```

This works really well with optional constructors:

```swift
extension Person: Serializable {
    private init?(name: String?, age: Int?, height: Float?) {
        if let name = name, age = age, height = height {
            self.age = age
            self.name = name
            self.height = height
        } else {
            return nil
        }
    }

    static func deserialize(deserializer: Serializer) -> Patient? {
        return Person(name:   <-deserializer["name"],
                      age:    <-deserializer["age"],
                      height: <-deserializer["height"])
    }
}
```

### Keyed values

Any model implementing `Serializable` should use the keyPath methods to serialize each required property.

### Root objects

Most JSON API endpoints will either return an array of items or a singular root level dictionary.
`Serializer` provides several keypath-less methods for serializing and deserializing these root level items.

 ```swift
 // Serialize an array as the root object
 func serialize<T: Serializable>(values: [T])
 func deserializeValue<T: Serializable>() -> [T]?

 // shorthand

 let friends: [Person]
 let serializer: Serializer
 serializer <- friends

 let friends: [Person]?
 let deserializer: Serializer
 friends <-deserializer
 ```

 ```swift
 // Serialize a dictionary as the root object
 func serialize<T: Serializable>(value: T)
 func deserializeValue<T: Serializable>() -> T?

// shorthand

let person: Person
let serializer: Serializer
serializer <- person

let person: Person?
let deserializer: Serializer
person <-deserializer

 ```

### Implementing `Serializable`

Any `class`, `struct` or `enum` that conforms to `Serializable` will be serializable by a `Serializer`.

You can nest `Serializable` objects. Below is an example of nesting a required `Person` value, *owner*, as well as the non-required *previous owners* which is held as an optional collection of `Person` objects.

```swift
struct Car {
    let manufacturer: String
    let model: String
    let owner: Person
    let previousOwners: [Person]?
}

extension Car: Serializable {
    private init?(manufacturer: String?, model: Int?, owner: Person?, previousOwners: [Person]?) {
        if let manufacturer = manufacturer, model = model, owner = owner {
            self.manufacturer = manufacturer
            self.model = model
            self.owner = owner
            self.previousOwners = previousOwners
        } else {
            return nil
        }
    }

    static func deserialize(deserializer: Serializer) -> Car? {
        return Car(manufacturer:   <-deserializer["manufacturer"],
                   model:          <-deserializer["model"],
                   owner:          <-deserializer["owner"],
                   previousOwners: <-deserializer["previousOwners"])
    }
}
```

### Creating your own `Serializer`

The `Serializer` protocol requires you to implement a set of methods to serialize and deserialize the fundamental base types, `Int`s, `Float`, `Double`, `String`, `Bool`.

```swift

// MARK: Serialization

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

```

You must also provide implementations to work with any type `T` that conforms to `Serializable`.

```swift

func serialize<T: Serializable>(value: T)
func serialize<T: Serializable>(value: T, forKeyPath keyPath: String)

func deserializeValue<T: Serializable>() -> T?
func deserializeValueForKeyPath<T: Serializable>(keyPath: String) -> T?

```

As well as providing methods to work with homogenous collections of the above types.

```swift
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
```
