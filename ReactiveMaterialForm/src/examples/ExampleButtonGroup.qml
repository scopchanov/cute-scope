import QtQuick 2.15
import QtQuick.Layouts 1.12
import "../components"

Item {
	id: root

	property var activatedItem

	implicitWidth: layout.width
	implicitHeight: layout.height

	RowLayout {
		id: layout

		Layout.fillWidth: true
		height: implicitHeight

		Rectangle {
			width: 100
			height: 64
			color: root.activatedItem === this ? "black" : "white"

			Behavior on color { ColorAnimation { duration: 150 } }

			MouseArea {
				anchors.fill: parent

				onClicked: root.activatedItem = parent
			}
		}

		Rectangle {
			width: 100
			height: 64
			color: root.activatedItem === this ? "black" : "white"

			Behavior on color { ColorAnimation { duration: 150 } }

			MouseArea {
				anchors.fill: parent

				onClicked: root.activatedItem = parent
			}
		}

		Rectangle {
			id: rect

			width: 100
			height: 64

			property bool activated: root.activatedItem === this

			MouseArea {
				anchors.fill: parent

				onClicked: root.activatedItem = parent
			}

			states: State {
				name: "activated"
				when: activated

				PropertyChanges { target: rect; color: "black" }
			}

			transitions: [
				Transition {
					to: "activated"
					reversible: true

					ColorAnimation { duration: 150 }
				}
			]
		}

		Rectangle {
			width: 100
			height: 64
			color: root.activatedItem === this ? "black" : "white"

			Behavior on color { ColorAnimation { duration: 150 } }

			MouseArea {
				anchors.fill: parent

				onClicked: root.activatedItem = parent
			}
		}
	}
}
