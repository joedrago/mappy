fs = require 'fs'

randomString = ->
  return Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15)

gperf = ""
gperfLines = fs.readFileSync("dlsym.gperf", "utf8").split(/[\n\r]/)
for line in gperfLines
  if line.length == 0
    continue
  gperf += "#{line}\n"
  if line == "%%"
    break

header = ""
source = "#include <stdio.h>\n\n"

for i in [0...15000]
  name = randomString()
  header += "void func_#{name}();\n"
  source += "void func_#{name}() { printf(\"#{name}\\n\"); }\n"
  gperf += "func_#{name},func_#{name}\n"

fs.writeFileSync("external.h", header);
fs.writeFileSync("external.c", source);
fs.writeFileSync("dlsym.gperf", gperf);
