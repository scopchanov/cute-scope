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

/*
 * Field Select
 */

ComboBox {
	id: root

	textRole: "text"
	valueRole: "value"

	delegate: ItemDelegate {
		width: root.width

		contentItem: Label {
			text: modelData.text
			color: root.currentIndex === index ? palette.windowText : palette.text
			font.weight: root.currentIndex === index ? Font.Medium : Font.Normal
			elide: Text.ElideRight
			verticalAlignment: Text.AlignVCenter
		}

		highlighted: root.highlightedIndex === index
	}

	indicator: Item {
		visible: false
	}

	contentItem: Label {
		leftPadding: 0
		rightPadding: root.indicator.width + root.spacing
		font.weight: Font.Medium
		text: root.displayText
		color: palette.windowText
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight

		background: Rectangle { color: "transparent" }
	}

	background: Rectangle { color: "transparent" }

	popup: Popup {
		y: root.y
		width: root.width
		padding: 0

		contentItem: ListView {
			id: listView

			implicitHeight: contentHeight
			model: root.popup.visible ? root.delegateModel : null
			currentIndex: root.highlightedIndex
			clip: true

			ScrollIndicator.vertical: ScrollIndicator {  }
		}

		background: Item {
			Elevation {
				source: asd
				distance: 8
			}

			Rectangle {
				id: asd
				anchors.fill: parent
				radius: 4
			}
		}

		onClosed: {
			root.focus = false
		}
	}

//	onCurrentValueChanged: console.log(currentValue)
}
