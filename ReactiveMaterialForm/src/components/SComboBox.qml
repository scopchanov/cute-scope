import QtQuick 2.15
import QtQuick.Controls 2.15
import Scope.ReactiveForms 1.0
import "../cdk"

/*
 * ComboBox
 */

FormElement {
	id: root

	readonly property bool isEmpty: comboBox.currentValue === "undefined"
	property string labelText: qsTr("Label")
	property string helperText: qsTr("Helper text")
	property string errorMessage: qsTr("Error message")
	property bool isRequired: false
	property bool isTouched: false

	implicitWidth: 280
	implicitHeight: 72
	opacity: enabled ? 1 : 0.25

	valid: true
	// Container
	Rectangle {
		id: container

		anchors.fill: parent
		anchors.bottomMargin: 16
		radius: 4
		color: comboBox.hovered ? palette.light : palette.base

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
			activated: comboBox.activeFocus
			color: palette.highlight
		}

		// Select
		ComboBox {
			id: comboBox

			anchors.fill: parent
			topPadding: 20
			bottomPadding: 8
			leftPadding: 16
			rightPadding: 48
//			text: value
//			onTextEdited: value = text
			textRole: "text"
			valueRole: "value"

			model: [
				{ text: "--" },
				{ value: Qt.NoModifier, text: qsTr("No modifier") },
				{ value: Qt.ShiftModifier, text: qsTr("Shift") },
				{ value: Qt.ControlModifier, text: qsTr("Control") }
			]

			delegate: ItemDelegate {
				width: comboBox.width
				contentItem: Text {
					text: modelData.text
					color: "#21be2b"
					font: comboBox.font
					elide: Text.ElideRight
					verticalAlignment: Text.AlignVCenter
				}
				highlighted: comboBox.highlightedIndex === index
			}

//			indicator: Canvas {
//				id: canvas
//				x: comboBox.width - width - comboBox.rightPadding
//				y: comboBox.topPadding + (comboBox.availableHeight - height) / 2
//				width: 12
//				height: 8
//				contextType: "2d"

//				Connections {
//					target: comboBox
//					function onPressedChanged() { canvas.requestPaint(); }
//				}

//				onPaint: {
//					context.reset();
//					context.moveTo(0, 0);
//					context.lineTo(width, 0);
//					context.lineTo(width / 2, height);
//					context.closePath();
//					context.fillStyle = comboBox.pressed ? "#17a81a" : "#21be2b";
//					context.fill();
//				}
//			}

			contentItem: Text {
				leftPadding: 0
				rightPadding: comboBox.indicator.width + comboBox.spacing

				text: comboBox.displayText
				font: comboBox.font
				color: comboBox.pressed ? "#17a81a" : "#21be2b"
				verticalAlignment: Text.AlignVCenter
				elide: Text.ElideRight
			}

			background: Rectangle {
//				implicitWidth: 120
//				implicitHeight: 40
//				border.color: comboBox.pressed ? "#17a81a" : "#21be2b"
//				border.width: comboBox.visualFocus ? 2 : 1
				color: "transparent"
				radius: 2
			}

			popup: Popup {
				y: comboBox.height - 1
				width: comboBox.width
				implicitHeight: contentItem.implicitHeight
				padding: 1

				contentItem: ListView {
					clip: true
					implicitHeight: contentHeight
					model: comboBox.popup.visible ? comboBox.delegateModel : null
					currentIndex: comboBox.highlightedIndex

					ScrollIndicator.vertical: ScrollIndicator { }
				}

				background: Rectangle {
					border.color: "#21be2b"
					radius: 2
				}
			}
		}

		// Label
		FieldLabel {
			id: label

			x: comboBox.leftPadding
			originY: 0.5*(parent.height - height)
			highlighted: comboBox.activeFocus
//			floating: !isEmpty
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
				comboBox.popup.open()

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
}
