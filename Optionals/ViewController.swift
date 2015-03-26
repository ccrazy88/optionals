//
//  ViewController.swift
//  Optionals
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /* Let's start by creating a name (type String) and a counterpart optional name (type
        String?) which contains the same value. */

        var name: String = "Chrisna"
        var optionalName: String? = "Chrisna"

        println("name: \(name)")
        println("optional name: \(optionalName)")

        /* A variable of type String must always be associated with a string, which, in this case,
        is "Chrisna". */

        // Compiler error: cannot assign a value of type 'nil to a value of type 'String'
        name = nil

        /* An optional can either be nil or have something inside of it. In the case of
        optionalName, what's inside of it, if anything, has to be a string because its type is
        String?. */

        optionalName = nil
        println("nil optional name: \(optionalName)")
        println()

        // Compiler error: cannot assign a value of type 'Int' to a value of type 'String?'
        optionalName = 25

        /* It makes sense for certain functions to return an optional. */

        let names = ["Amanda", "Bryan", "Chris", "Derek"]
        let noNames: [String] = []

        // func first(x: [String]) -> String?
        println("first in populated list: \(names.first)")
        println("first in empty list: \(noNames.first)")
        println()

        /* Sometimes, it's debatable. */

        // subscript(index: Int) -> T
        // Note here that the return type is T. This refers to the type associated with the array
        // and is covered under the advanced Swift topic of "generics" and "associated types".
        var t = names[0]
        println("value for existing index: \(t)")

        // Fatal error: array index out of range
        t = names[5]

        let points = ["A": 1, "C": 3, "E": 5]

        // subscript(key: Key) -> Value?
        // Note here that we can assign optional types to be immutable. Why would you ever do this?
        // If you control everything about the value, then you probably shouldn't, but in this case,
        // we don't know whether the key "A" has a value *and* we don't want it to change once we
        // retrieve it.
        let value = points["A"]
        println("value for existing key: \(value)")

        let missingValue = points["B"]
        println("value for nonexistent key: \(missingValue)")
        println()

        /* An optional string (String?) is an entirely different type from a regular string
        (String). This means that it doesn't have access to the same methods that a regular string
        does. */

        name = "Chrisna"
        println("uppercase name: \(name.uppercaseString)")

        optionalName = "Chrisna"

        // Compiler error: value of optional type 'String?' not unwrapped; did you mean to use '!'
        // or '?'?
        println(optionalName.uppercaseString)

        println("optional name w/ ?: \(optionalName?.uppercaseString)")
        println("optional name w/ !: \(optionalName!.uppercaseString)")
        println()

        // Optional chaining: <some_optional>?.<something>

        struct Name {
            let first: String
            let last: String
        }

        var structuredName: Name?
        println("structured (nil) first name: \(structuredName?.first)")

        structuredName = Name(first: "Chrisna", last: "Aing")
        println("structured (filled) first name: \(structuredName?.first)")
        println()

        // Implicit and forced unwrapping: !
        
        var implicitlyUnwrappedOptionalName: String! = "Chrisna"
        println("implicitly unwrapped optional: \(implicitlyUnwrappedOptionalName)")

        if optionalName != nil {
            println("forced unwrapping: \(optionalName!)")
        }
        println()

        // Nil coalescing: ??

        optionalName = "Chrisna"
        var lastName: String?
        var fullName: String {
            return join(" ", [optionalName ?? "John", lastName ?? "Doe"])
        }
        println("incomplete full name: \(fullName)")

        lastName = "Aing"
        println("new full name: \(fullName)")
    }

}
