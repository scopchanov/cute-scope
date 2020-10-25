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

	property alias title: labelTitle.text
	property alias subtitle: labelSubTitle.text

	implicitHeight: 48

	background: Rectangle {
		id: base

		color: "transparent"

		MouseArea {
			anchors.fill: parent
			cursorShape: Qt.PointingHandCursor
			enabled: false
		}
	}

	RowLayout {
		anchors.fill: parent
		spacing: 0

		Label {
			id: labelTitle

			Layout.fillWidth: true
			Layout.leftMargin: 20
			color: palette.windowText
			font.weight: Font.Medium
		}

		Label {
			id: labelSubTitle

			Layout.fillWidth: true
			color: palette.text
			font.pointSize: 11
		}

		ExpandedIndicator {
			id: indicator

			Layout.rightMargin: 15
			expanded: panel.expanded
			source: "../pix/images/icons/16/arrow-down.png"
		}
	}

	onClicked: panel.toggle()

	states: [
		State {
			name: "disabled"
			when: !enabled

			PropertyChanges { target: base; color: palette.window }
			PropertyChanges { target: labelTitle; color: palette.mid }
			PropertyChanges { target: labelSubTitle; color: palette.mid }
		},
		State {
			name: "pressed"
			when: down

			PropertyChanges {
				target: base
				color: Qt.darker(palette.midlight, 1.1)
			}
		},
		State {
			name: "focused"
			when: activeFocus

			PropertyChanges {
				target: base
				color: palette.midlight
			}
		},
		State {
			name: "hover"
			when: hovered

			PropertyChanges {
				target: base
				color: palette.light
			}
		}
	]
}
