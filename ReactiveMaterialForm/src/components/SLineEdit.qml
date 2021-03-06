/**
MIT License

Copyright (c) 2020 Michael Scopchanov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import QtQuick 2.15
import QtQuick.Controls 2.15
import Scope.ReactiveForms 1.0
import "../cdk"

/*
 * Line Edit
 */

FormElement {
	id: root

	readonly property bool isEmpty: fieldInput.text === ""
	property string labelText: qsTr("Label")
	property string helperText: qsTr("Helper text")
	property string errorMessage: qsTr("Error message")
	property bool isRequired: false
	property bool isTouched: false
	property bool shown: true

	implicitWidth: 280
	implicitHeight: 72
	opacity: enabled ? 1 : 0.25
//	valid: !isRequired || !isEmpty

	Behavior on opacity {
		NumberAnimation {
			duration: 150
			easing.type: Easing.InOutQuad
		}
	}

	// Container
	Rectangle {
		id: container

		clip: true
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
		ActivationIndicator {
			id: activationIndicator

			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			implicitWidth: parent.width
			color: palette.highlight
			activated: fieldInput.activeFocus
		}

		// Input
		FieldInput {
			id: fieldInput

			anchors.fill: parent
			topPadding: 20
			bottomPadding: 8
			leftPadding: 16
			rightPadding: 48
			verticalAlignment: TextInput.AlignVCenter
			text: value
			onTextEdited: value = text
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
				root.clear()

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

	states: [
		State {
			name: "error"
			when: isRequired && isTouched && isEmpty

			PropertyChanges { target: label; error: true }
			PropertyChanges { target: activationIndicator; color: "#F44336" }
		},
		State {
			name: "hidden"
			when: !shown

			PropertyChanges { target: root; visible: false }
		}
	]

	transitions: [
		Transition {
			to: "hidden"

			SequentialAnimation {
				PropertyAction {
					target: root
					property: "visible"
					value: true
				}

				ParallelAnimation {
					NumberAnimation {
						target: root
						property: "implicitHeight"
						to: 0.0
						duration: 250
						easing.type: Easing.InOutQuad
					}

					NumberAnimation {
						target: root
						property: "opacity"
						from: 1.0; to: 0.0
						duration: 250
						easing.type: Easing.InOutQuad
					}
				}

				PropertyAction {
					target: root
					property: "visible"
					value: false
				}
			}
		},
		Transition {
			from: "hidden"

			ParallelAnimation {
				NumberAnimation {
					target: root
					property: "implicitHeight"
					from: 0.0; to: 72.0
					duration: 250
					easing.type: Easing.InOutQuad
				}

				NumberAnimation {
					target: root
					property: "opacity"
					from: 0.0; to: 1.0
					duration: 250
					easing.type: Easing.InOutQuad
				}
			}
		}]
}
