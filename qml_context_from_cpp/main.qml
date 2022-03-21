import QtQuick
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Component.onCompleted: {
        // we can also set the property directly from qml
        messageClass.message = "set from qml %1";
    }
    // we no longer need to use connection
    Column {
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
    }
}
