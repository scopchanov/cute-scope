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

AbstractButton {
	id: root

	property alias toolTipText: toolTip.text
	property alias initialColor: panel.initialColor
	property alias color: panel.color

	implicitWidth: label.implicitWidth + indicator.implicitWidth
	opacity: down ? 0.9 : 1
	scale: down ? 0.97 : 1

	onClicked: popup.open()

	Behavior on opacity { NumberAnimation { duration: 75 } }
	Behavior on scale { NumberAnimation { duration: 75 } }

	RowLayout {
		anchors.fill: parent
		spacing: 0

		Label {
			id: label

			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			padding: 9
			text: root.text
			color: enabled ? palette.buttonText : palette.mid
		}

		Rectangle {
			id: indicator
			implicitWidth: 20
			implicitHeight: 20
			border.color: palette.dark
			color: enabled ? panel.color : palette.mid
		}
	}

	AppToolTip {
		id: toolTip

		visible: root.hovered && !popup.opened
	}

	Popup {
		id: popup

		x: root.width - width
		y: root.height
		padding: 0
		modal: false
		focus: true

		background: Rectangle {
			color: "transparent"
		}

		ColorPanel {
			id: panel
		}
	}
}
