import Foundation
 
/* let file = "test.txt" */
let file = "input.txt"
let dirURL = URL(fileURLWithPath: FileManager().currentDirectoryPath) 
let fileURL = dirURL.appendingPathComponent(file)

let content = (try! String(contentsOf: fileURL, encoding: .utf8))

let lines = content.split(separator: "\n")

func part1()->Int {
  var tab = [[Int]]()

  let R = lines.count
  let C = lines[0].count
  
  for line in lines {
    let array = Array(line)
    tab.append(array.map({x in x.wholeNumberValue!}))
  }

  var gamma_str = ""
  var eps_str = ""

  for j in 0..<C {
    let zeroBits = (0..<R).filter({i in tab[i][j] == 0}).count
    let oneBits = (0..<R).filter({i in tab[i][j] == 1}).count
    if zeroBits > oneBits {
      gamma_str += "0"
      eps_str += "1"
    } else {
      gamma_str += "1"
      eps_str += "0"
    }
  }

  return Int(gamma_str, radix: 2)! * Int(eps_str, radix: 2)!
}


func part2()->Int {
  var tab = [[Int]]()

  let C = lines[0].count
  
  for line in lines {
    let array = Array(line)
    tab.append(array.map({x in x.wholeNumberValue!}))
  }

  var oxygen_str = ""

  // oxygen
  for j in 0..<C {
    let zeroBits = (0..<tab.count).filter({i in tab[i][j] == 0}).count
    let oneBits = (0..<tab.count).filter({i in tab[i][j] == 1}).count
    if tab.count > 1 {
      if zeroBits > oneBits {
        oxygen_str += "0"
        tab = tab.filter({line in line[j] == 0})
      } else {
        oxygen_str += "1"
        tab = tab.filter({line in line[j] == 1})
      }
    } else {
      if zeroBits > oneBits {
        oxygen_str += "0"
      } else {
        oxygen_str += "1"
      }
    }
  }


  tab = []
  for line in lines {
    let array = Array(line)
    tab.append(array.map({x in x.wholeNumberValue!}))
  }

  var co2_str = ""
  // co2
  for j in 0..<C {
    let zeroBits = (0..<tab.count).filter({i in tab[i][j] == 0}).count
    let oneBits = (0..<tab.count).filter({i in tab[i][j] == 1}).count
    if tab.count > 1 {
      if zeroBits <= oneBits {
        co2_str += "0"
        tab = tab.filter({line in line[j] == 0})
      } else {
        co2_str += "1"
        tab = tab.filter({line in line[j] == 1})
      }
    } else {
        co2_str += String(tab[0][j])
    }
  }

  return Int(oxygen_str, radix: 2)! * Int(co2_str, radix: 2)!
}

/* print(part1()) */
print(part2())

