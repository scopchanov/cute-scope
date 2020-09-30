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

ApplicationWindow {
	id: mainWindow

	width: 1040
	height: 840
	minimumWidth: graphicsView.implicitWidth
	minimumHeight: graphicsView.implicitHeight
	visible: true
	title: qsTr("Dynamic Background Grid")

	FontLoader { id: regular; source: "bin/fonts/roboto/Roboto-Regular.ttf" }
	FontLoader { id: medium; source: "bin/fonts/roboto/Roboto-Medium.ttf" }
	FontLoader { id: bold; source: "bin/fonts/roboto/Roboto-Bold.ttf" }

	property real scaleMultiplier: 1

	header: AppToolBar {
		id: toolBar
	}

	RowLayout {
		anchors.fill: parent
		anchors.margins: 20

		GraphicsView {
			id: graphicsView

			Layout.alignment: Qt.AlignCenter
			Layout.fillWidth: true
			Layout.fillHeight: true
			Layout.maximumWidth: scene.width*zoom
			Layout.maximumHeight: scene.height*zoom
			implicitWidth: 400
			implicitHeight: 300
			zoom: slider.value * scaleMultiplier

			gridPattern: toolBar.gridPattern
			gridSize: Qt.size(toolBar.gridSize, toolBar.gridSize)
			gridColor: toolBar.gridColor
			backgroundColor: toolBar.backgroundColor
			gridVisible: toolBar.hasGrid
			backgroundVisible: toolBar.hasBackground
		}
	}

	footer: ToolBar {
		palette.button: mainWindow.palette.window
		RowLayout {
			anchors.fill: parent

			ZoomSlider {
				id: slider

				Layout.fillHeight: true
				Layout.alignment: Qt.AlignHCenter
				implicitWidth: 300
			}
		}
	}
}
