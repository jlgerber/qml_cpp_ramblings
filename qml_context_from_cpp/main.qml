import QtQuick
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    function javaScriptFunction(value) {
        print("C++ called the javascriptFunction iwth the parameter " + value);
        return "This message was returned from a JavaScript function."
    }

    function logger(element) {
        print("Array element:"+element)
    }

    function logArray(anArray) {
        anArray.forEach(logger)
    }

    function logMap(theMap) {
        for (var element in theMap) {
            print("Object item:", element, "=", theMap[element])
        }

    }
    // we no longer need to use connection
    Column {
        spacing:  5;
        Text {
            text: qsTr("Hello Integration World")
        }

        Button {
            id: textId
            // get text directly from messageClass message property
            text: messageClass.message
            width: 200
            // the slot no longer takes a parameter. doMessageChange simply calls the setMessage property setter
            //onClicked:  messageClass.doMessageChange()
            // we can also call directly
            onClicked: messageClass.message = "Updated from QML %1"; //messageClass.doMessageChange()
           background: Rectangle {
                radius: 5
                width: parent.width
                height: parent.height
                color: "#333333"
           }
            palette {
                //button: "#333333"
                buttonText: hovered ? "white" : "#999999"
            }
        }

        Button {
            id: btn2Id
            text: "Talk to CPP"
            width: 200

            onClicked:{
                var result = messageClass.sendMessageFromCpp("This is QML saying Hi")
                print("result: " + result)
            }
           background: Rectangle {
                radius: 5
                width: parent.width
                height: parent.height
                color: "#444444"
           }
            palette {
                buttonText: hovered ? "white" : "#999999"
            }
        }
    }
}
