import QtQuick
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // connect javascript funtion to c++ signal
    Connections {
        target: messageClass
        // value is the name of the messageClass.messageChanged slot argument in c++
        onMessageChanged: function onMessageChanged(value) {textId.text = value;}
    }
    Column {
        Text {
            text: qsTr("Hello Integration World")
        }

        Button {
            id: textId
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
