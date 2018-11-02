//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



//REDUCE FUNCTION
func customReduce(startingNum: Double, inputArray: [Double], reduce: (Double, Double) -> Double) -> Double {
    var sum = startingNum
    for number in inputArray {
        sum = reduce(sum, number)
    }
    return sum
}

//REDUCE ADDITION CLOSURE
let reduceAdditionClosure = {(int1: Double, int2: Double) -> Double in
    return int1 + int2
}

//REDUCE MULTIPLY CLOSURE
var reduceMultiplyClosure = { (firstValue: Double, nextValue: Double) -> Double in
    return firstValue * nextValue
}

//MAP FUNCTION
func customMap(givenNumber: Double, inputArray: [Double], map: (Double, Double) -> Double) -> [Double] {
    var anArray = [Double]()
    for number in inputArray {
        let result = map(number, givenNumber)
        anArray.append(result)
    }
    return anArray
}

//MAP MULTIPLY CLOSURE
let mapMultiplyClosure = {(num1: Double, givenNumber: Double) -> Double in
    return num1 * givenNumber
}

//MAP DIVIDE CLOSURE
let mapDivideClosure = {(num1: Double, givenNumber: Double) -> Double in
    return num1 / givenNumber
}

//FILTER FUNCTION
func customFilter(inputArray: [Double], filter: (Double) -> Bool) -> [Double] {
    var emptyArray = [Double]()
    for number in inputArray {
        if filter(number) {
            emptyArray.append(number)
        }
    }
    return emptyArray
}


//FUNCTION FOR RANDOM OPERATOR GAME
func randomGame(a:Double, b:Double) {
    let operandList = ["+", "-", "*", "/","?"]
    if let randomOperator = operandList.randomElement() {
        let randomOperation = mathStuffFactory(opString: randomOperator)
        let result = randomOperation(a, b)
        print("\(a) ? \(b) = \(result)")
        print("Which operand did the calculator use?")
        let userInput = readLine()
        if userInput == randomOperator {
            print("Correct!")
            startCalculator()
        } else {
            print("Wrong! The correct answer is \(randomOperator)")
            startCalculator()
        }
    }
}

//FUNCTION FOR SIMPLE MATH
func mathStuffFactory(opString: String) -> (Double, Double) -> Double {

    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}

//FUNCTION FOR SIMPLE MATH CALCULATOR
func regularCalculator() {

    var firstDouble: Double
    var secondDouble: Double

    if let userInput = readLine()?.components(separatedBy: " ") {
        if let checkFirstDouble = Double(userInput[0]) {
            firstDouble = checkFirstDouble
        } else {
            firstDouble = 0.0
            print("Invalid input, try again!")
            regularCalculator()
        }

        if let checkSecondDouble = Double(userInput[2]) {
            secondDouble = checkSecondDouble
        } else {
            secondDouble = 0.0
            print("Invalid input, try again!")
            regularCalculator()
        }

        let operand = (userInput[1])
        if operand != "+" && operand != "-" && operand != "*" && operand != "/" && operand != "?"{
            print("Invalid operand, try again!")
            regularCalculator()
        }

        if operand == "?" {
            randomGame(a:firstDouble, b:secondDouble)
        } else {
            let mathOperation = mathStuffFactory(opString: operand)
            let result = mathOperation(firstDouble, secondDouble)
            print("\(firstDouble) \(operand) \(secondDouble) = \(result)")
        }

    }
    startCalculator()
}

//FUNCTION FOR HIGH-ORDER FUNCTION CALCULATOR
func complexCalculator() {
    let complexInputOptional = readLine()?.lowercased().components(separatedBy: " ")
    guard let complexInput = complexInputOptional else {
        print("You enter nothing. Please try again.")
        return complexCalculator()
    }
    let highOrderWord = complexInput[0]
    let arrayOfDoublesString = complexInput[1].components(separatedBy: ",")
    let userOperator = complexInput[3]
    let givenNumberString = complexInput[4]
    
    let arrayOfDoubles = arrayOfDoublesString.compactMap({numStr in Double(numStr)})
    let givenNumber = Double(givenNumberString)!    //bang need to be fixed
    
    switch highOrderWord {
    case "filter":
        switch userOperator {
        case ">":
            let result = customFilter(inputArray: arrayOfDoubles) { (num: Double) -> Bool in
                return num > givenNumber
            }
            print(result)
        case "<":
            let result = customFilter(inputArray: arrayOfDoubles) { (num: Double) -> Bool in
                return num < givenNumber
            }
            print(result)
        default:
            print("Invalid operator.")
            complexCalculator()
        }
        
    case "map":
        switch userOperator {
        case "*":
            let result = customMap(givenNumber: givenNumber, inputArray: arrayOfDoubles, map: mapMultiplyClosure)
            print(result)
        case "/":
            let result = customMap(givenNumber: givenNumber, inputArray: arrayOfDoubles, map: mapDivideClosure)
            print(result)
        default:
            print("Invalid operator.")
            complexCalculator()
        }
        
    case "reduce":
        switch userOperator {
        case "+":
            let result = customReduce(startingNum: givenNumber, inputArray: arrayOfDoubles, reduce: reduceAdditionClosure)
            print(result)
        case "*":
            let result = customReduce(startingNum: givenNumber, inputArray: arrayOfDoubles, reduce: reduceMultiplyClosure)
            print(result)
        default:
            print("Invalid operator.")
            complexCalculator()
            
        }
    default:
        print("You did not enter a proper high-order function.")
        complexCalculator()
    
    
    }
    
    startCalculator()
    
}

//FUNCTION FOR CALCULATOR START MENU
func startCalculator(){
    print("What type of calculation would you like? Type 1 for regular operations or 2 for high-order functions.")
    let userInput = readLine()?.lowercased()
    switch userInput{
    case "1":
        print("Enter your operation e.g 10 + 2")
        regularCalculator()
    case "2":
        print("Enter your operation e.g filter 1,2,3,4,5 by < 3")
        complexCalculator()
    default:
        print("invalid input")
        startCalculator()
    }
}

startCalculator()


