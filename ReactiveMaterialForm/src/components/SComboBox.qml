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
 * Combo Box
 */

FormElement {
	id: root

	readonly property bool isEmpty: comboBox.currentValue === null
	property string labelText: qsTr("Label")
	property string helperText: qsTr("Helper text")
	property string errorMessage: qsTr("Error message")
	property bool isRequired: false
	property bool isTouched: false
	property alias model: comboBox.model

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

		// Bottom border
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
			activated: comboBox.activeFocus
		}

		// Select
		FieldSelect {
			id: comboBox

			anchors.fill: parent
			topPadding: 20
			bottomPadding: 8
			leftPadding: 16
			rightPadding: 48
			displayText: isEmpty ? "" : currentText
		}

		// Label
		FieldLabel {
			id: label

			x: comboBox.leftPadding
			originY: 0.5*(parent.height - height)
			highlighted: comboBox.activeFocus
			floating: !isEmpty
			text: isRequired ? labelText + " *" : labelText
		}

		// Drop-down indicator
		Image {
			source: "/pix/images/icons/24/indicator-down.png"
			anchors.verticalCenter: container.verticalCenter
			anchors.right: parent.right
			anchors.rightMargin: 12
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
