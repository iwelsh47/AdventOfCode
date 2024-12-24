//
//  main.swift
//  Advent of Code 2015
//
//  Created by Ivan Welsh on 24/12/2024.
//

import Foundation

extension String {
    func trimmed() -> String { self.trimmingCharacters(in: .whitespacesAndNewlines) }
}

func loadData(from filename: String) -> String {
    let filePath = "Advent of Code 2015/data/\(filename)"
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8).trimmed()
        return contents
    } catch {
        print("Could not load data from file \(filePath). \(error.localizedDescription).")
        exit(EXIT_FAILURE)
    }
}


func Day01() {
    /*
     Santa is trying to deliver presents in a large apartment building, but he can't find the right floor - the directions
     he got are a little confusing. He starts on the ground floor (floor 0) and then follows the instructions one character
     at a time.
     
     An opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one
     floor.
     
     The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.
     
     For example:
     
     -  (()) and ()() both result in floor 0.
     -  ((( and (()(()( both result in floor 3.
     -  ))((((( also results in floor 3.
     -  ()) and ))( both result in floor -1 (the first basement level).
     -  ))) and )())()) both result in floor -3.
     
     To what floor do the instructions take Santa?
     */
    let input = loadData(from: "Day01")
    
    var currentFloor: Int = 0
    input.forEach{
        if $0 == "(" {
            currentFloor += 1
        } else {
            currentFloor -= 1
        }
    }
    print("Part one solution: \(currentFloor)")
    
    /*
     Now, given the same instructions, find the position of the first character that causes him to enter the basement
     (floor -1). The first character in the instructions has position 1, the second character has position 2, and so on.
     
     For example:
     
     -  ) causes him to enter the basement at character position 1.
     -  ()()) causes him to enter the basement at character position 5.
     
     What is the position of the character that causes Santa to first enter the basement?
     */
    currentFloor = 0
    for c in input.enumerated() {
        if c.element == "(" {
            currentFloor += 1
        } else {
            currentFloor -= 1
        }
        if currentFloor == -1 {
            print("Part two solution: \(c.offset + 1)")
            break
        }
    }
}
