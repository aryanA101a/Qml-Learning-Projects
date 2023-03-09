import QtQuick 2.15
import QtQuick.Window 2.15

Text {
id: label
x: 24; y: 24
// custom counter property for space presses
property int spacePresses: 0
text: "Space pressed: " + spacePresses + " times"
// (1) handler for text changes. Need to use function to ca
onTextChanged: function(text) {
    console.log("text changed to:", text)
}

// need focus to receive key events
focus: true
// (2) handler with some JS
Keys.onSpacePressed: {
increment()
}
// clear the text on escape
Keys.onEscapePressed: {
label.text = ''
}

// (3) a JS function
function increment() {
spacePresses = spacePresses + 1
}
}
