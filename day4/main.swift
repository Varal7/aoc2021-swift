import Foundation
 
/* let file = "test.txt" */
let file = "input.txt"
let dirURL = URL(fileURLWithPath: FileManager().currentDirectoryPath) 
let fileURL = dirURL.appendingPathComponent(file)

let content = (try! String(contentsOf: fileURL, encoding: .utf8))

let lines = content.split(separator: "\n",  omittingEmptySubsequences: false)

func part1()->Int {
  let nums = lines[0].split(separator: ",").map({x in Int(x)!})

  var grids = [[[Int]]]()
  var buf = [[Int]] ()
  for line in lines[2...] {
    if line == "" {
      grids.append(buf)
      buf = []
    } else {
      buf.append(line.split(separator: " ").map({x in Int(x)!}))
    }
  }

  for k in 0..<nums.count {
    let sub = nums[...k]
    for grid in grids {
      let R = grid.count
      let C = grid[0].count
      if (0..<R).contains(where: {i in (0..<C).allSatisfy({j in sub.contains(grid[i][j])})}) 
        || (0..<C).contains(where: {j in (0..<R).allSatisfy({i in sub.contains(grid[i][j])})}) {
          var count = 0;
          for i in 0..<R {
              for j in 0..<C {
                if !sub.contains(grid[i][j]) {
                  count += grid[i][j]
                }
            }
          }
          return count * sub[sub.count - 1]
      }
    }
  }
  return 0

}

func part2()->Int {
  let nums = lines[0].split(separator: ",").map({x in Int(x)!})

  var grids = [[[Int]]]()
  var buf = [[Int]] ()
  for line in lines[2...] {
    if line == "" {
      grids.append(buf)
      buf = []
    } else {
      buf.append(line.split(separator: " ").map({x in Int(x)!}))
    }
  }

  var done = [Int]()

  for k in 0..<nums.count {
    let sub = nums[...k]
    for (idx, grid) in grids.enumerated() {
      let R = grid.count
      let C = grid[0].count
      if (0..<R).contains(where: {i in (0..<C).allSatisfy({j in sub.contains(grid[i][j])})}) 
        || (0..<C).contains(where: {j in (0..<R).allSatisfy({i in sub.contains(grid[i][j])})}) {
          if !done.contains(idx) {
            done.append(idx)
          }
          if done.count == grids.count {
            var count = 0
            for i in 0..<R {
                for j in 0..<C {
                  if !sub.contains(grid[i][j]) {
                    count += grid[i][j]
                  }
              }
            }
            return count * sub[sub.count - 1]
          }
      }
    }
  }
  return 0

}

/* print(part1()) */
print(part2())

