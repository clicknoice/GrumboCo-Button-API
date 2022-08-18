# GrumboCo-Button-API
A simple lightweight button API for ComputerCraft.

----------------------------------------------------------------------------------------

To start, let's run through an example.

(see example.lua for a smaller version of this explanation.)

Let's start by requiring the button API.
```pastebin get eVPAMF4e```

```lua
local button = require("FILEPATH")
```

You now have access the the button object; heres how to create a button.

```lua
local btn = button.new(number: x, number: y, number: w, number: h, string: name, number: color, function: func, boolean: isClickable)
```

Let's break it down.

```
x:           Give the x coordinate of the button. (buttons draw from the top left downwards.)
y:           Give the y coordinate of the button.
w:           Give the width of the button.
h:           Give the height of the button.
name:        Sets the text of the button. (You can put an empty string if you dont wish to have a name.)
color:       Sets the color of the button. Uses the colors API.
func:        Sets the function that you wish to trigger when the button is clicked.
isClickable: Whether or not the button is clickable; if false, it grays out the button.
```

Now that you know how to setup a button, let's go through a simple program!

```lua
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
```

This program should draw the following button.
It does its best to center the text.

![image](https://user-images.githubusercontent.com/97827691/185297920-9638923e-e0d5-4cf1-aac2-d154eda5ac41.png)

And if you click on it...

![image](https://user-images.githubusercontent.com/97827691/185297970-0fc46ab1-4ad5-4a97-8d49-cc2b41007c0f.png)

That's how to use the Grumbo Co Button API.
