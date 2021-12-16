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

func part1()->Int {
  var li = content.strip().split(separator: ",").map({x in Int(x)!})
  li.sort()
  let med = li[li.count/2]
  return li.map({x in abs(x-med)}).reduce(0, +)
}

func part2()->Int {
  let li = content.strip().split(separator: ",").map({x in Int(x)!})
  let mean = li.reduce(0, +) / li.count

  func ss(n:Int) -> Int { return n * (n + 1) / 2}
  func cost(n: Int) -> Int { li.map({x in ss(n:abs(x-n))}).reduce(0, +)}
  return ((mean-1...mean+1).map({cand in cost(n: cand)})).min() ?? 0
}

/* print(part1()) */
print(part2())

