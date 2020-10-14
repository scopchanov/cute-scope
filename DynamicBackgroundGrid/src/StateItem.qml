import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id: root

	property int index
	property string name
	property size gridSize

	function snapToGrid(n, axis) {
		var step = axis === "x" ? gridSize.width : axis === "y"
								  ? gridSize.height : 0

		if (step === 0)
			return n
		else
			return Math.round(n/step)*step;
	}

	implicitWidth: childrenRect.width
	implicitHeight: childrenRect.height

	onXChanged: x = snapToGrid(x, "x")
	onYChanged: y = snapToGrid(y, "y")

	Rectangle {
		id: circle

		width: 40; height: 40
		color: "#FFD740"
		border.color: "#424242"
		border.width: 1.5
		radius: 20

		Text {
			id: labelIndex

			anchors.centerIn: parent
			horizontalAlignment: Qt.AlignHCenter
			verticalAlignment: Qt.AlignVCenter
			font.pointSize: 10
			color: "#757575"
			text: index
		}
	}

	Label {
		id: labelName

		anchors.top: circle.bottom
		anchors.horizontalCenter: circle.horizontalCenter
		anchors.topMargin: 5
		padding: 5
		color: "#424242"
		text: name === "" ? qsTr("~undefined~") : name

		background: Rectangle { color: "white" }
	}

	MouseArea {
		id: mouseArea

		anchors.fill: circle
		drag.target: parent
	}
}
