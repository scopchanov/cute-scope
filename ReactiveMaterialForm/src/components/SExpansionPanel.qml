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
import QtGraphicalEffects 1.15
import "../cdk"

Item {
	id: root

	default property alias content: panel.content
	property alias title: expansionHeader.title
	property alias subtitle: expansionHeader.subtitle

	implicitHeight: container.height

	// Drop shadow
	Elevation { source: container; distance: 2 }

	// Container
	Item {
		id: container

		width: parent.width
		height: base.height

		// Base
		Rectangle {
			id: base

			width: parent.width
			height: mainLayout.implicitHeight
			layer.enabled: true
			layer.effect: OpacityMask {
				maskSource: Rectangle {
					width: base.width
					height: base.height
					radius: 4
				}
			}

			// Main layout
			ColumnLayout {
				id: mainLayout

				width: parent.width
				height: implicitHeight
				spacing: 0

				// Header
				ExpansionHeader {
					id: expansionHeader
					Layout.fillWidth: true
				}

				// Collapsible panel
				Collapsible {
					id: panel

					Layout.fillWidth: true
				}
			}
		}
	}
}
