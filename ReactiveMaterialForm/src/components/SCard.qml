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
import "../cdk"

/*
 * SCard
 */

Item {
	id: root

	property alias title: txtTitle.text
	default property alias content: contentItem.children
	property alias actions: actionRow.children

	Elevation {
		source: card
	}

	Rectangle {
		id: card

		anchors.fill: parent
		radius: 6

		ColumnLayout {
			anchors.fill: parent

			Text {
				id: txtTitle
//				Layout.fillWidth: true
				font { family: "Roboto"; pointSize: 15; weight: Font.Medium }
				lineHeight: 32
				padding: 20
				color: palette.windowText
//				visible: text !== ""
				text: title
				z: -1
			}

			Item {
				id: contentItem

				Layout.fillWidth: true
				Layout.fillHeight: true
			}

			RowLayout {
				id: actionRow
			}
		}
	}
}
