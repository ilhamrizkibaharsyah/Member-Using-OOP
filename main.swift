//
//  main.swift
//  Member
//
//  Created by Ilham Rizki Baharsyah on 23/03/22.
//

import Foundation

// get input from user form String
func getInputString(message: String) -> String {
    print(message, terminator: " ")
    return readLine() ?? ""
}

// get input from user form Integer
func getInputInt(message: String) -> Int? {
    return Int(getInputString(message: message))
}

// create protocol Person
protocol PersonProtocol {
    var firstName: String { set get }
    var middleName: String { set get }
    var lastName: String { set get }
    var address: String { set get }
    func fullName() -> String
}

// create class Person: containing PersonProtocol
class Person: PersonProtocol {
    var firstName: String
    var middleName: String
    var lastName: String
    var address: String
    init(firstName: String, middleName: String, lastName: String, address: String) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.address = address
    }
    
    // create function to combine firstName + middleName + lastName to be func and save it to fullName()
    func fullName() -> String {
        var parts: [String] = []
        parts += [firstName]
        parts += [middleName]
        parts += [lastName]
        return parts.joined(separator: " ")
    }
    
}

protocol StudentProtocol {
    var school: String { set get }
    func getInformation() -> String
}

class Student: Person, StudentProtocol {
    var school: String = ""
    
    func getInformation() -> String {
        return "Hello! My name is \(fullName()), I'm from \(address) and now i studied in \(school) university"
    }
}

print("Welcome to Academy")
print("------------------")

let firstName = getInputString(message: "Input your first name  :")
let middleName = getInputString(message: "Input your middle name :")
let lastName = getInputString(message: "Input your last name   :")
let address = getInputString(message: "Input your address     :")
let school = getInputString(message: "Input your school      :")

let member = Student(firstName: firstName, middleName: middleName, lastName: lastName, address: address)
member.school = school

print("------------------")
print(member.getInformation())
print("------------------")
print("Thank you!\n")
