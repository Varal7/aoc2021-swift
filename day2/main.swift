import Foundation
 
/* let file = "test.txt" */
let file = "input.txt"
let dirURL = URL(fileURLWithPath: FileManager().currentDirectoryPath) 
let fileURL = dirURL.appendingPathComponent(file)

let content = (try! String(contentsOf: fileURL, encoding: .utf8))

let lines = content.split(separator: "\n")

func part1()->Int {
  var h = 0
  var d = 0
  for line in lines {
    let c = line.split(separator: " ")
    if c[0] == "forward" {
      h += Int(c[1])!
    } else if c[0] == "down" {
      d += Int(c[1])!
    } else if c[0] == "up" {
      d -= Int(c[1])!
    }
  }
  return h * d
}

func part2()->Int {
  var h = 0
  var d = 0
  var aim = 0
  for line in lines {
    let c = line.split(separator: " ")
    if c[0] == "forward" {
      h += Int(c[1])!
      d += Int(c[1])! * aim
    } else if c[0] == "down" {
      aim += Int(c[1])!
    } else if c[0] == "up" {
      aim -= Int(c[1])!
    }
  }
  return h * d
}


/* print(part1()) */
print(part2())

