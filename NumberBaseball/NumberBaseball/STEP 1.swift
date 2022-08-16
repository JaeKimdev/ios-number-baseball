//
//  STEP 1.swift
//  NumberBaseball
//
//  Created by 이준영 on 2022/08/16.
//

import Foundation

var baseballRandomNumbers: Array<Int> = makeThreeRandomNumbers()
var remainCount: Int = 9

func makeThreeRandomNumbers() -> Array<Int> {
    let randomNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    var baseballGameNumbers: Array<Int> = []
    for number in 0...2 {
        baseballGameNumbers.append(randomNumbers[number])
    }
    return baseballGameNumbers
}

func compareNumbers(myNumbers: Array<Int>) {
    var strike: Int = 0
    var ball: Int = 0
    
    for number in 0...2 {
        if baseballRandomNumbers[number] == myNumbers[number] {
            strike += 1
        } else if baseballRandomNumbers.contains(myNumbers[number]) {
            ball += 1
        }
    }
    remainCount -= 1
    printResult(strike: strike, ball: ball)
}

func printResult(strike: Int, ball: Int) {
    print("""
          \(strike) 스트라이크, \(ball) 볼
          남은 기회: \(remainCount)
          """)
    if strike == 3 {
        remainCount = 0
        print("사용자 승리!")
    } else if remainCount == 0 {
        print("컴퓨터 승리...!")
    }
}

func startGame() {
    var isLoop = true
    while isLoop {
        let myNumbers: Array<Int> = makeThreeRandomNumbers()
        print("임의의 수 : \(myNumbers.description.trimmingCharacters(in: ["[", "]"]))")
        compareNumbers(myNumbers: myNumbers)
        if remainCount == 0 {
            isLoop = false
        }
    }
}