A [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) wrapper that implements [Milk](https://github.com/jordanhamill/Milk) `Serializer`.

*Note: Milk requires Swift 2.0 as it uses protocol extensions to provide default implementations of common methods.*

### Example

```swift

struct Person {
    let name: String
    let age: Int
    let weight: Float

    init(age: Int, name: String, height: weight) {
        self.age = age
        self.name = name
        self.weight = weight
    }
}

extension Person: Serializable {
    private init?(name: String?, age: Int?, weight: Float?) {
        if let name = name, age = age, weight = weight {
            self.age = age
            self.name = name
            self.weight = weight
        } else {
            return nil
        }
    }

    func serialize(serializer: Serializer) {
        serializer["age"] <- age
        serializer["name"] <- name
        serializer["weight"] <- weight
    }

    static func deserialize(deserializer: Serializer) -> Patient? {
        return Person(name:   <-deserializer["name"],
                      age:    <-deserializer["age"],
                      weight: <-deserializer["weight"])
    }
}
```

```swift
let jsonSerializer: Serializer = JSONSerializer()
let person: Person = Person(name: "Matt", age: 12, weight: 71.2)
person.serialize(jsonSerializer)

if let jsonString = jsonSerializer.json.rawString() {
    print(jsonString)
	// {
	//    "name": "Matt",
	//    "age": 12,
	//    "weight": 71.2
	// }
}
```
