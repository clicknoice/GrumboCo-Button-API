--button api
--TODO: let the term use the monitor api if a monitor is found.

local button = {}

button.__index = button

local function placeholder()
    print("Please enter a function in the func parameter.")
end

function button.new(x, y, w, h, name, clr, func, isClickable)
    local this = {}

    setmetatable(this, button)

    this.x = x or 5
    this.y = y or 5
    this.w = w or 5
    this.h = h or 5
    this.name = name or ""
    this.clr = clr or 1
    this.func = func or placeholder()
    this.isClickable = isClickable or false

    return this
end

--TODO: average the string's length, and draw the text from there relative to the button.
local function centerText(x, y, w, h, text)
    local newX = math.floor(x + w / 2 - string.len(text) + 3)
    local newY = math.floor(y + h / 2)
    return newX, newY
end

function button:draw()
    term.setBackgroundColor(self.clr)
        for i = 0, self.h do
                term.setCursorPos(self.x, self.y+i)
                term.write(" ")

            for j = 0, self.w do
                term.write(" ")
            end
        end

    local centerX, centerY = centerText(self.x, self.y, self.w, self.h, self.name)
    term.setCursorPos(centerX, centerY)
    term.setBackgroundColor(colors.black)
end

function button:detect(x, y)
    if self.isClickable then
        if y >= self.y and y <= self.y + self.h
            if x >= self.x and x <= self.x + self.w
                self.func()
            end
        end
    end
end

return button
