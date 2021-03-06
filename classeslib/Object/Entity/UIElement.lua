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

--- UIElement
--
-- Root class of UI elements
--
-- @classmod Object.Entity.UIElement

local Vector  = require("caress/Vector")

local _class = {}

local rectangle
local layout

function _class:init(parent, coh)
  self.super:init(parent, coh)
  
  rectangle = Vector.new()
end

function _class:getRectangle()
  return rectangle
end

function _class:setRectangle(rect)
  rectangle = rect:cpy()
end

function _class:getPosition()
  return Vector.new(rectangle.x, rectangle.y)
end

function _class:setPosition(pos)
  rectangle.x = pos.x
  rectangle.y = pos.y
end

function _class:getSize()
  return Vector.new(rectangle.z, rectangle.w)
end

function _class:setSize(size)
  rectangle.z = size.x
  rectangle.w = size.y
end

function _class:setLayout(_layout)
  layout = _layout
end

function _class:getLayout()
  return layout
end

return _class
