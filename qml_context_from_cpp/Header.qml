import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    color: headerBgColor
    anchors {top: parent.top; left: parent.left; right: parent.right; }
    height: 65

    RowLayout {
        id : logoGrid
        anchors {left:parent.left; right: parent.right}

//                Image {
//                    id: swatLogo
//                    source: ""
//                }
        Rectangle {
            width: 140; height: 65;
            color: "red"
            Text {
                text: "Some Company"
                font{family: headerFontFamily; pointSize: logoFontSize; weight: Font.Bold}
                horizontalAlignment: Text.AlignHCenter;
                y: 20
            }
        }
        Rectangle {
            width: 20; height: 65;
            color: "transparent"

        }
        Text {
            text: "Software and Technical\nTean\nat Syncor Systems"
            font{family: headerFontFamily; pointSize: companyFontSize}
            color: companyFontColor
        }

        Text {
            text: MainViewMgr.appName
            font{family: headerFontFamily; pointSize: headerFontSize; weight: Font.Bold}
            horizontalAlignment: Text.AlignHCenter;
            Layout.fillWidth: true;
            color: gradientEndColor
        }
    }
}
