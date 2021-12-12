import Foundation
 
/* let file = "test.txt" */
let file = "input.txt"
let dirURL = URL(fileURLWithPath: FileManager().currentDirectoryPath) 
let fileURL = dirURL.appendingPathComponent(file)

let content = (try! String(contentsOf: fileURL, encoding: .utf8))

let lines = content.split(separator: "\n")

func part1()->Int {
  var count = 0
  var previous = Int(lines[0])!
  for line in lines {
    let cur = Int(line)!
    if cur > previous {
        count += 1
      }
    previous = cur
  }
  return count
}

func part2()->Int {
  var count = 0
  var previous: Int? = nil

  let n = lines.count

  for i in 1...n-2 {
    let cur = lines[i-1...i+1].map({x in Int(x)!}).reduce(0, +)
    if let previous = previous {
      if cur > previous {
          count += 1
        }
    }
    previous = cur
  }
  return count
}


/* print(part1()) */
print(part2())

