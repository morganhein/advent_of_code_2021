import std/streams
import strutils as str

proc readStream(): seq[string] =
  var output: seq[string]
  #TODO: figure out the runtime path for this? we gettting ahead of ourselves here though
  var input = newFileStream("/home/morgan/Projects/personal/advent_of_code_2021/01/input.txt", fmRead)
  var line = ""
  if not isNil(input):
    while input.readLine(line):
      output.add(line)
    input.close()

  return output



proc radar(input: seq[string]) =
  echo("running radar on ", len(input), " items")
  var lastValue: int = -1
  var greaterThanCount: int = 0
  for i, elem in input:
    var elemInt = str.parseInt(elem)
    if lastValue == -1:
      lastValue = elemInt
      continue
    if elemInt > lastValue:
      greaterThanCount = greaterThanCount + 1
    lastValue = elemInt
  echo(greaterThanCount)

var result = readStream()
radar(result)