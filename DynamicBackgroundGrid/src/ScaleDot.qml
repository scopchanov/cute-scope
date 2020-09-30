import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
	id: root

	property alias text: markText.text

	implicitWidth: 8; implicitHeight: 8; radius: 4
	color: "#616161"

	Text {
		id: markText

		anchors.horizontalCenter: parent.horizontalCenter
		anchors.bottom: parent.top
		anchors.bottomMargin: 8
		color: "#424242"
	}
}
