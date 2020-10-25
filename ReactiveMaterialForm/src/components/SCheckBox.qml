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
 * CheckBox
 */

FormElement {
	id: root

	property alias label: checkBox.text

	implicitWidth: checkBox.implicitWidth
	implicitHeight: checkBox.implicitHeight
	valid: true

	CheckBox {
		id: checkBox

		checked: value
		onCheckStateChanged: {
			ripple.start()
			value = checked
		}

		indicator: Item {
			implicitWidth: 40
			implicitHeight: 40
			x: checkBox.leftPadding
			y: 0.5*parent.height - 0.5*height

			Rectangle {
				id: base

				implicitWidth: 40
				implicitHeight: 40
				anchors.centerIn: parent
				radius: 0.5*implicitWidth
				color: palette.button
				visible: false

				states: [
					State {
						name: "hover"
						when: checkBox.hovered

						PropertyChanges {
							target: base
							visible: true
							opacity: 0.04
						}
					},
					State {
						name: "focus"
						when: activeFocus

						PropertyChanges {
							target: base
							visible: true
							opacity: 0.12
						}
					},
					State {
						name: "pressed"
						when: checkBox.down

						PropertyChanges {
							target: base
							visible: true
							opacity: 0.14
						}
					}
				]
			}

			Ripple {
				id: ripple

				anchors.centerIn: parent
				width: box.width
				color: palette.button
			}

			Rectangle {
				id: box

				implicitWidth: 18
				implicitHeight: 18
				anchors.centerIn: parent
				border.width: 2
				border.color: checkBox.checked ? palette.button
											   : Qt.rgba(0, 0, 0, 0.54)
				color: checkBox.checked ? palette.button : "transparent"
				radius: 2

				// Check Mark
				CheckboxMark {
					id: checkMark

					anchors.centerIn: parent
					visible: checkBox.checked
				}
			}
		}

//		contentItem: Text {
//			text: checkBox.text
//			font: checkBox.font
//			opacity: enabled ? 1.0 : 0.3
//			color: checkBox.down ? "#17a81a" : "#21be2b"
//			verticalAlignment: Text.AlignVCenter
//			leftPadding: checkBox.indicator.width + checkBox.spacing
//		}
	}
}
