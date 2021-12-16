import Foundation
 
/* let file = "test.txt" */
let file = "input.txt"
let dirURL = URL(fileURLWithPath: FileManager().currentDirectoryPath) 
let fileURL = dirURL.appendingPathComponent(file)

let content = (try! String(contentsOf: fileURL, encoding: .utf8))

extension String
{   
    func strip() -> String
   {
    return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
   }
}

func iter(d: [Int: Int], n: Int)-> [Int: Int] {
  if n == 0 { return d }
  var new = [Int: Int]()
  new[8] = d[0]
  new[7] = d[8]
  new[6] = (d[7] ?? 0) + (d[0] ?? 0)
  for i in 0...5 {
    new[i] = d[i+1] ?? 0
  }
  return iter(d: new, n: n-1)
}

func part1()->Int {
  let li = content.strip().split(separator: ",").map({x in Int(x)!})
  var counts = [Int: Int]()
  for el in li {
    counts[el, default:0] += 1
  }
  return iter(d: counts, n : 80).values.reduce(0, +)
}

func part2()->Int {
  let li = content.strip().split(separator: ",").map({x in Int(x)!})
  var counts = [Int: Int]()
  for el in li {
    counts[el, default:0] += 1
  }
  return iter(d: counts, n : 256).values.reduce(0, +)
}

/* print(part1()) */
print(part2())

