import Foundation
 
/* let file = "test.txt" */
let file = "input.txt"
let dirURL = URL(fileURLWithPath: FileManager().currentDirectoryPath) 
let fileURL = dirURL.appendingPathComponent(file)

let content = (try! String(contentsOf: fileURL, encoding: .utf8))

let lines = content.split(separator: "\n")

struct CoordType: Hashable {
  let x: Int
  let y: Int

  func hash(into hasher: inout Hasher) {
      hasher.combine(self.x)
      hasher.combine(self.y)
  }
}

func part1()->Int {
  var d = [CoordType: Int]()

  for line in lines {
      let parts = line.components(separatedBy: " -> ")
      let fromCoords = parts[0].split(separator: ",")
      let toCoords   = parts[1].split(separator: ",")
      let from = CoordType(x: Int(fromCoords[0])!, y:Int(fromCoords[1])!)
      let to = CoordType(x: Int(toCoords[0])!, y:Int(toCoords[1])!)

      if (from.x == to.x) {
        for j in min(from.y, to.y)...max(from.y, to.y){
            d[CoordType(x: from.x, y: j), default: 0] += 1
          }
      }
      else if (from.y == to.y) {
        for i in min(from.x, to.x)...max(from.x, to.x) {
            d[CoordType(x: i, y: from.y), default: 0] += 1
          }
      }

    }
    return d.values.filter({x in x > 1}).count
}

func part2()->Int {
  var d = [CoordType: Int]()

  for line in lines {
      let parts = line.components(separatedBy: " -> ")
      let fromCoords = parts[0].split(separator: ",")
      let toCoords   = parts[1].split(separator: ",")
      let from = CoordType(x: Int(fromCoords[0])!, y:Int(fromCoords[1])!)
      let to = CoordType(x: Int(toCoords[0])!, y:Int(toCoords[1])!)

      if (from.x == to.x) {
        for j in min(from.y, to.y)...max(from.y, to.y){
            let i = from.x
            d[CoordType(x: i, y: j), default: 0] += 1
          }
      }
      else if (from.y == to.y) {
        for i in min(from.x, to.x)...max(from.x, to.x) {
            let j = from.y
            d[CoordType(x: i, y: j), default: 0] += 1
          }
      } else if (to.x - from.x) * (to.y - from.y) > 0 {
        for (i, j) in zip(min(from.x, to.x)...max(to.x, from.x), min(from.y,to.y)...max(from.y, to.y)) {
            d[CoordType(x: i, y: j), default: 0] += 1
          }
        }
      else {
        for (dj, i) in (min(from.x, to.x)...max(to.x, from.x)).enumerated() {
            let j = max(from.y, to.y) - dj
            d[CoordType(x: i, y: j), default: 0] += 1
          }
        }
    }

  return d.values.filter({x in x > 1}).count
}

/* print(part1()) */
print(part2())

