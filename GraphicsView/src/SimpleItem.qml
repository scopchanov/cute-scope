import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id: root

	property bool selected: false
	property alias fillColor: rect.color
	property alias labelText: label.text

	signal pressed(var mouse)

	implicitHeight: 40

	Rectangle {
		id: rect

		anchors.fill: parent
		anchors.bottomMargin: 1

		Rectangle {
			id: selectionRect

			anchors.fill: parent
			color: "#2196F3"
			opacity: 0.25

			visible: selected
		}

		Label {
			id: label

			anchors.fill: parent
			horizontalAlignment: Qt.AlignHCenter
			verticalAlignment: Qt.AlignVCenter
		}
	}

	MouseArea {
		id: mouseArea

		anchors.fill: parent

		onPressed: root.pressed(mouse)
	}
}
