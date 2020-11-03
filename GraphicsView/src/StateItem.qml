import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id: root

	property alias labelName: txtName.text
	property alias labelIndex: txtIndex.text
	property bool selected: false
	property alias movable: mouseArea.enabled

	implicitWidth: childrenRect.width
	implicitHeight: childrenRect.height

	Rectangle {
		id: selectionIndicator

		width: 44; height: 44
		color: "#42A5F5"
		radius: 22
		opacity: 0.5
	}

	Rectangle {
		id: circle

		width: 40; height: 40
		anchors.centerIn: selectionIndicator
		color: "#FFD740"
		border.color: "#424242"
		border.width: 1.5
		radius: 20

		Text {
			id: txtIndex

			anchors.centerIn: parent
			horizontalAlignment: Qt.AlignHCenter
			verticalAlignment: Qt.AlignVCenter
			font.pointSize: 10
		}
	}

	Label {
		id: txtName

		anchors.top: circle.bottom
		anchors.horizontalCenter: circle.horizontalCenter
		anchors.topMargin: 5
		padding: 5

		background: Rectangle {
			color: "white"
		}
	}

	MouseArea {
		id: mouseArea

		anchors.fill: circle
		drag.target: parent
	}

	state: selected ? "selected" : "normal"

	states: [
		State {
			name: "normal"
			PropertyChanges { target: selectionIndicator; visible: false}
			PropertyChanges { target: circle; scale: 1.0 }
		},
		State {
			name: "selected"
			PropertyChanges { target: selectionIndicator; visible: true}
		}
	]

	transitions: [
		Transition {
			to: "normal"

			SequentialAnimation {
				PropertyAnimation { properties: "scale"; to: 0.95;
					duration: 100 }
				PropertyAnimation { properties: "scale"; duration: 100 }
			}
		},
		Transition {
			to: "selected"

			SequentialAnimation {
				PropertyAnimation { properties: "scale"; to: 1.05;
					duration: 100 }
				PropertyAnimation { properties: "scale"; duration: 100 }
			}
		}
	]
}
