//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

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
    startMenu()
}

func complexCalculator() {
    
    var highOrderInt2: Int
    var highOrderArray: [Int]()
    
    if let complexInput = readLine()?.components(separatedBy: " ") {
       
        
        
    }
    startMenu()
    
}



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
            startMenu()
        } else {
            print("Wrong! The correct answer is \(randomOperator)")
            startMenu()
        }
    }
}

func startMenu(){
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
        startMenu()
    }
}

startMenu()

////MAP
////
//func customMap(number1: Int, inputArray: [Int], map: (Int, Int) -> Int) -> [Int] {
//    var anArray = [Int]()
//    for number in inputArray {
//        let result = map(number, number1)
//        anArray.append(result)
//    }
//    return anArray
//}
//
//let mapMultiplyClosure = {(num1: Int, num2: Int) -> Int in
// return num1 * num2
//}
//
//let mapDivideClosure = {(num1: Int, num2: Int) -> Int in
//    return num1 / num2
//}
//
//print(customMap(number1: aNumber, inputArray: something, map: mapDivideClosure))

//FILTER
//func customFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
//    var emptyArray = [Int]()
//    for number in inputArray {
//        if filter(number) {
//            emptyArray.append(number)
//        }
//    }
//    return emptyArray
//}
//
//let arr = [10,9,2,3,4,60]
//let userOperator = ">"
//let givenValue = 6
//
//switch userOperator {
//case ">":
//    let result = customFilter(inputArray: arr) { (num: Int) -> Bool in
//        return num > givenValue
//    }
//case "<":
//    let result = customFilter(inputArray: arr) { (num: Int) -> Bool in
//        return num < givenValue
//    }
//default: continue
//}
//
//customFilter(inputArray: array) { (num: Int) -> Bool in
//    return num > someNumber1
//}

////REDUCE
//func customReduce(startingNum: Int, inputArray: [Int], reduce: (Int, Int) -> Int) -> Int {
//    var sum = startingNum
//    for number in inputArray {
//    sum = reduce(sum, number)
//    }
//return sum
//}
//
//let customReduceClosure = {(int1: Int, int2: Int) -> Int in
//   return int1 + int2
//}
//
//var reduceMultiplyClosure = { (firstValue: Int, nextValue: Int) -> Int in
//        return firstValue * nextValue
//}
