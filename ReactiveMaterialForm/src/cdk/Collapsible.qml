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
import QtQuick.Layouts 1.12

/*
 * Collapsible
 */

Pane {
	id: root

	default property alias content: contentLayout.children
	property bool expanded: false

	function toggle() {
		expanded = !expanded
	}

	focusPolicy: Qt.ClickFocus
	height: implicitHeight
	implicitHeight: 0
	visible: false
	opacity: 0.0
	padding: 10

	background: Rectangle {
		color: "transparent"
	}

	ColumnLayout {
		id: contentLayout

		width: parent.width
		height: implicitHeight
	}

	states: State {
		name: "expanded"
		when: expanded

		PropertyChanges { target: root; visible: true }
	}

	transitions: [
		Transition {
			to: "expanded"

			ParallelAnimation {
				NumberAnimation {
					target: root
					property: "implicitHeight"
					to: contentLayout.implicitHeight + 2*root.verticalPadding
					duration: 250
					easing.type: Easing.InOutQuad
				}

				NumberAnimation {
					target: root
					property: "opacity"
					to: 1.0
					duration: 250
					easing.type: Easing.InOutQuad
				}
			}
		},
		Transition {
			from: "expanded"

			SequentialAnimation {
				PropertyAction {
					target: root; property: "visible"; value: true
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
						to: 0.0
						duration: 250
						easing.type: Easing.InOutQuad
					}
				}

				PropertyAction {
					target: root; property: "visible"; value: false
				}
			}
		}
	]
}
