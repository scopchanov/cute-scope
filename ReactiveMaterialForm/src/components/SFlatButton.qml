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
import QtGraphicalEffects 1.15
import "../cdk"

/*
 * Flat Button
 */

AbstractButton {
	id: root

	implicitWidth: label.implicitWidth + 16
	implicitHeight: 36
	scale: down ? 0.97 : 1

	onClicked: {
		ripple.x = pressX - 0.5*ripple.width
		ripple.y = pressY - 0.5*ripple.height
		ripple.start()
	}

	Behavior on scale { ScaleAnimator { duration: 25 } }

	background: Item {
		id: container

		anchors.fill: parent

		Rectangle {
			id: base

			anchors.fill: parent
			color: "transparent"
			layer.enabled: true
			layer.effect: OpacityMask {
				maskSource: Rectangle {
					width: base.width
					height: base.height
					radius: 4
				}
			}

//			Behavior on color { ColorAnimation { duration: 150 } }

			Ripple {
				id: ripple

				width: root.width
				color: Qt.lighter(palette.button, 1.7)
			}

			MouseArea {
				anchors.fill: parent
				cursorShape: "PointingHandCursor"
				enabled: false
			}
		}
	}

	ButtonLabel {
		id: label

		anchors.centerIn: parent
		color: palette.button
		text: root.text
	}

	states: [
		State {
			name: "disabled"
			when: !enabled

			PropertyChanges { target: label; color: palette.mid }
		},
		State {
			name: "focused"
			when: activeFocus

			PropertyChanges {
				target: base
				color: Qt.lighter(palette.button, 2.15)
			}
		},
		State {
			name: "hover"
			when: hovered

			PropertyChanges {
				target: base
				color: Qt.lighter(palette.button, 2.23)
			}
		}
	]
}
