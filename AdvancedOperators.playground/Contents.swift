//: Playground - noun: a place where people can play

import UIKit

var bits: UInt8 = 0b00001111

var invertBits: UInt8 = ~bits

var firstBit: UInt8 = 0b00111111
var secondBit: UInt8 = 0b11111100

var andedBit: UInt8 = firstBit & secondBit

var oredBit = firstBit | secondBit

var xoredBit = firstBit ^ secondBit

let shiftBits = andedBit >> 2

shiftBits << 3


