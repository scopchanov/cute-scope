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

Item {
	id: root

	property real zoom: 1.0
	property string gridPattern
	property color gridColor
	property alias gridSize: grid.sourceSize
	property alias backgroundColor: background.color
	property alias gridVisible: grid.visible
	property alias backgroundVisible: background.visible
	property alias scene: scene

	onZoomChanged: {
		var zoomPoint = Qt.point(0.5*flickable.width + flickable.contentX,
								 0.5*flickable.height + flickable.contentY);

		flickable.resizeContent(scene.width*zoom, scene.height*zoom, zoomPoint);
		flickable.returnToBounds();
	}

	Flickable {
		id: flickable

		anchors.fill: parent
		contentWidth: scene.width
		contentHeight: scene.height
		boundsMovement: Flickable.StopAtBounds
		boundsBehavior: Flickable.StopAtBounds
		clip: true

		Item {
			id: scene

			anchors.centerIn: parent
			implicitWidth: 1200
			implicitHeight: 800
			transformOrigin: Item.Center
			scale: zoom

			Rectangle {
				id: background

				anchors.fill: parent
			}

			Image {
				id: grid

				anchors.fill: parent
				horizontalAlignment: Image.AlignLeft
				verticalAlignment: Image.AlignTop
				fillMode: Image.Tile
				source: "image://icons/" + gridPattern + "/" + gridColor
			}

			Label {
				anchors.centerIn: parent
				text: qsTr("Grid area")
				padding: 12
				font { weight: Font.Medium; pointSize: 24 }
				background: Rectangle {
					color: "white"
					border.color: palette.mid
					opacity: 0.75
					radius: 4
				}
			}
		}

		ScrollBar.horizontal: ScrollBar {}
		ScrollBar.vertical: ScrollBar {}
	}

	Rectangle {
		id: frame

		anchors.fill: parent
		color: "transparent"
		border.color: palette.mid
	}
}
