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

--
--- Anonymous class.
--
-- This class allows the declaration of inline anonymous classs.
--
-- @classmod Object.Entity.Anonymous

local List  = require("caress/collection").List

local _class = {}

local methods
local protectedMethods = List.new{"init", "main", "update", "draw"}

function _class:init(parent, layer, coh, _methods)

  if _methods.init then
    _methods.init(self, parent, layer, coh)
  else
    self.super:init(parent, layer, coh)
  end
  
  methods = _methods
  
  for name, method in pairs(methods) do
    if not protectedMethods:contains(name) then
      self[name] = method
    end
  end 
end

function _class:main(coh)
  if methods.main then
    methods.main(self, coh)
  end
end

function _class:update(dt)
  if methods.update then
    methods.update(self, dt)
  end
end

function _class:draw()
  if methods.draw then
    methods.draw(self)
  end
end

return _class
