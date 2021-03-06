-- Caress, a small framework for games in lua and love.
-- Copyright (C) 2016  Erivaldo Filho "desadoc@gmail.com"

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

package.path =
  "./?.lua;./?/init.lua;" .. package.path

local classes = require("caress/classes")

classes.registerClass(classes, "A", "caress/tests/classes/A")
classes.registerClass(classes.A, "B", "caress/tests/classes/A/B")
classes.registerClass(classes.A, "C", "caress/tests/classes/A/C")

if classes.finish then
  classes.finish()
end

local table_insert = table.insert

local a = classes.A:new()
local b = classes.A.B:new()
local c = classes.A.C:new()

c:foo4()

local n = 12.5*1000*1000

for i=1,n do
  a.bar = a.bar + b.bar
  b.bar = b.bar + c.bar
  c.bar = c.bar + a.bar
  
  a.bar = a.bar > b.bar and a.bar - b.bar or 21
  b.bar = b.bar > c.bar and b.bar - c.bar or 42
  c.bar = c.bar > a.bar and c.bar - a.bar or 84
end
