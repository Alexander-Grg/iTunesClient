//
//  Monads.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.01.2022.
//

import Foundation

precedencegroup MonadicPrecedence {
    associativity: left
    higherThan: BitwiseShiftPrecedence
}

infix operator >>- : MonadicPrecedence

//If the value of A type exists, there will be executed method F which come back U type
// otherwise we'll get nil

@inline(__always)
@discardableResult
public func >>-<T, U>(a: T?, f: (T) throws -> U?) rethrows -> U? {
    switch a {
    case .some(let x):
        return try f(x)
    case .none:
        return nil
    }
}
