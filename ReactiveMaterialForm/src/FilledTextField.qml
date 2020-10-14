import QtQuick 2.15
import QtQuick.Controls 2.15

/*
 * Filled Text Field
 */

Item {
	id: root

	readonly property bool isEmpty: fieldInput.text === ""
	property string labelText: qsTr("Label")
	property string helperText: qsTr("Helper text")
	property string errorMessage: qsTr("Error message")
	property bool isRequired: false
	property bool isTouched: false
	property alias text: fieldInput.text

	implicitWidth: 280
	implicitHeight: 72
	opacity: enabled ? 1 : 0.25

	Behavior on opacity {
		NumberAnimation {
			duration: 150
			easing.type: Easing.InOutQuad
		}
	}

	// Container
	Rectangle {
		id: container

		anchors.fill: parent
		anchors.bottomMargin: 16
		radius: 4
		color: fieldInput.hovered ? palette.light : palette.base
		Rectangle {
			id: bottomBorder

			height: 1
			color: palette.mid
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.right: parent.right
		}

		// Activation indicator
		FieldActivationIndicator {
			id: activationIndicator

			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			activated: fieldInput.activeFocus
			color: palette.highlight
		}

		TextField {
			id: fieldInput

			anchors.fill: parent
			topPadding: 20
			bottomPadding: 6
			leftPadding: 16
			rightPadding: 48
			palette.text: "black"
			selectByMouse: true

			background: Rectangle { color: "transparent" }

			onActiveFocusChanged: {
				if (!activeFocus) {
					if (focusReason !== Qt.OtherFocusReason) {
						isTouched = true;
					}
				} else if (focusReason === Qt.TabFocusReason
						|| focusReason === Qt.BacktabFocusReason) {
					fieldInput.selectAll();
				}
			}
		}

		// Label
		FieldLabel {
			id: label

			x: fieldInput.leftPadding
			originY: 0.5*(parent.height - height)
			highlighted: fieldInput.activeFocus
			floating: !isEmpty
			text: isRequired ? labelText + " *" : labelText
		}

		// Trailing Icon
		FieldIcon {
			anchors.verticalCenter: container.verticalCenter
			anchors.right: parent.right
			anchors.rightMargin: 12
			visible: !isEmpty
			iconSource: "/pix/images/icons/24/clear-outline.png"

			onClicked: {
				fieldInput.clear()

				if (state !== "focused")
					focus = true
			}
		}
	}

	// Helper text/Error message
	Text {
		id: txtBottom

		anchors.baseline: parent.bottom
		anchors.left: parent.left
		anchors.leftMargin: 16
		padding: 0
		font.pointSize: 8.25
		color: palette.text
		text: helperText
	}

	states: State {
		name: "error"
		when: isRequired && isTouched && isEmpty

		PropertyChanges { target: label; error: true }
		PropertyChanges { target: activationIndicator; color: "#F44336" }
	}
}
