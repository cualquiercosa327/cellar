local Slab = require "libs.Slab"
local class = require "libs.cruxclass"
local utils = require "libs.utils"

------------------------------ Constructor ------------------------------
local CwPredatorPrey = class("CwPredatorPrey")
function CwPredatorPrey:init(world, controller)
	self.world = world
	self.controller = controller
	local c = self.controller.Controls
	
	self.controller:addControl("outOfBoundsState", c.CHECKBOX)
	self.controller:addControl("initialLivingPercentage", c.SLIDER, {step = 2})
	self.controller:addControl("generations", c.BUTTON_STEPPER, {steps = {5, 1}, min = 1, max = 25})
	self.controller:addControl("survive", c.CHECKBOX_LIST, {count = 8})
	self.controller:addControl("born", c.CHECKBOX_LIST, {count = 8})
end

function CwPredatorPrey:update(dt)
	self.controller:setGroup(self.world)
end

function CwPredatorPrey:draw(g2d)
	g2d.setBackgroundColor(0.4, 0.88, 1.0)
	self.world:dDraw(g2d)
end

return CwPredatorPrey


