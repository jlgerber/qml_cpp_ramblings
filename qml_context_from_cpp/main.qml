import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: mainViewWindow
    width: 1024
    height: 600
    visible: true
    title: qsTr(MainViewMgr.appName)

    property string headerFontFamily: "Tahoma"
    property int companyFontSize: 10
    property string companyFontColor: "darkred"
    property int headerFontSize: 18
    property string headerBgColor: "white"
    property int logoFontSize: 10

    property string gradientStartColor: "skyblue"
    property string gradientEndColor: "blue"

    property int rowLeftMargin: 5;
    property string boldLabelFont: "Impact"
    property real hoverOpacity: .75
    property url powerOnSource: "/images/power_on.png"
    property url powerOffSource: "/images/power_off.png"
    property url powerSource: powerOffSource
    property bool powerOn: MainViewMgr.powerOn

    function togglePower() {
        powerOn = !powerOn
        print("main.qml in togglePower with value " + powerOn)
        powerSource = powerOn ? powerOnSource : powerOffSource
        MainViewMgr.powerOn = powerOn
    }
    Gradient {
        id: appGradientId
        GradientStop{position: 0.0; color: gradientStartColor}
        GradientStop{position: 1.0; color: gradientEndColor}
    }
    //==================MAIN VIEW====================
    Rectangle {
        //used to find structures in cpp
        id: mainViewRect
        objectName: "mainViewRect"

        anchors.fill: parent
        gradient: appGradientId

        //---------header-------------
        Header {
            id: headerId
        }
        //----------Controls----------
        RowLayout {
            id: powerKnobRowId
            anchors {
                top: headerId.bottom
                topMargin: 15
                left: parent.left
                right: parent.right
                leftMargin: rowLeftMargin
            }
            ColumnLayout {
                id: powerAreaId
                Layout.alignment: Qt.AlignTop
                Text {
                    text: "RF Power"
                    Layout.alignment: Qt.AlignCenter
                    color: "white"
                    font {
                        pointSize: 16
                        family: boldLabelFont
                    }
                }
                Image {
                    id: powerButtonId
                    source: powerSource
                    Layout.preferredWidth: 64
                    Layout.preferredHeight: Layout.preferredWidth
                    MouseArea {
                        onClicked: togglePower()
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.opacity =  hoverOpacity
                        onExited: parent.opacity = 1.0
                    }
                }
            }

            ColumnLayout {
            id: velocityColumnId
            }

            ColumnLayout {
            id: distanceColumnId
            }
        }

        RowLayout {
            id: presetRowId
            anchors {
                bottom: parent.bottom
                bottomMargin: 10
                left: parent.left
                right: parent.right
                leftMargin: 30
            }
            Layout.alignment: Qt.AlignBottom
        }

    }
}
