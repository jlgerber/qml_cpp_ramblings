import QtQuick
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {
        Text {
            text: qsTr("Hello Integration World")
        }

        Button {
            text: "Change Text"
            width: 200
            onClicked: messageClass.doMessageChange()

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
