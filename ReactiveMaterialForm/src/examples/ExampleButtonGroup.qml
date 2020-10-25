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
