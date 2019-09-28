--- Project-wide configuration for ltypekit-parser
-- @module config
-- @author daelvn
-- @copyright 23.07.2019
debugkit = require "debugkit"
unpack or= table.unpack

--- Debugging flags and options
DEBUG          = false
DEBUG_INSPECT  = DEBUG and require"inspect" or setmetatable {}, {__call:->}
DEBUG_DEPTH    = 5
DEBUG_KEYWORDS = { }
DEBUG_COLORS   =
  "==>": "yellow"
  "->":  "green"
  "*":   "magenta"
  "::":  "blue"
  "!!":  "red"
DEBUG_FI       = (path) =>
  i = DEBUG_INSPECT
  switch path[#path]
    when i.key
      lk = path[#path-1]
      return nil if lk == "__tostring"
      return nil if lk == "__call"
      return nil if lk == "__parent"
      return nil if lk == "instances"
      return nil if lk == "safe"
      return nil if lk == "silent"
      return nil if lk == "__sig"
      return @
    when i.metatable
      return @
    else
      return @

-- Start
import mapM,
       doInstant,
       finspect,
       fprint,
       filterKeywords,
       fsprint,
       cfsprint,
       color,
       colorall from debugkit DEBUG

doInstant!
finspect!!!!
y = ((finspect DEBUG_INSPECT) DEBUG_FI) DEBUG_DEPTH
p = (cfsprint color DEBUG_COLORS) DEBUG_KEYWORDS

{ :p, :y, :colorall }
