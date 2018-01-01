//: Playground - noun: a place where people can play

import UIKit

var stepper = 1

func increment(by incrementer: inout Int) {
    incrementer += stepper
}

increment(by: &stepper)

var stepperCopy = stepper

increment(by: &stepperCopy)

stepper = stepperCopy

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / y
    y = sum - x
}

var player1 = 50
var player2 = 35

balance(&player1, &player2)

//balance(&player2, &player2)

