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

local _class = {}

local elapsedTime = 0.0
local delay = 0.0

function _class:init(coh, _delay)
  self.super:init(coh)
  
  delay = _delay
end

function _class:update(dt)
  elapsedTime = elapsedTime + dt
end

function _class:result()
  if elapsedTime >= delay then
    return elapsedTime
  end
  
  return nil
end

return _class
