--requiring the button api.
local button = require("apis/button")

--test function
local function test()
    print("click!")
end

--clear the terminal to get rid of any buttons/text.
term.clear()

--we need to instantiate the button object.
--                      x   y  w   h    name       color     func  canClick
local btn1 = button.new(10, 5, 11, 5, "sample", colors.blue, test,   true)

--we need a function to populate the buttons. (useful for more than one button)
local function populateSelections()
    btn1:draw()
end

--call the populateSections function. this will draw all buttons in the function to the screen.
populateSelections()

--wait for an event on an infinite loop. if we get a click at the buttons x and y, call the function.
while true do
    local event, btn, x, y = os.pullEvent("mouse_click")
    btn1:detect(x, y)
end
