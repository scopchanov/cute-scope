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

Frame {
	id: root

	property color initialColor
	property color color: Qt.hsla(sliderH.value, sliderS.value,
								  sliderL.value, 1.0)

	implicitWidth: 300
	implicitHeight: 180

	clip: true
	background: Rectangle {
		color: "white"
		opacity: 0.9
		radius: 6
		border.color: palette.mid
	}

	ColumnLayout {
		anchors.fill: parent
		spacing: 0

		LabeledSlider {
			id: sliderH

			Layout.fillWidth: true
			Layout.fillHeight: true
			text: qsTr("Hue")
			value: initialColor.hslHue
		}

		LabeledSlider {
			id: sliderS

			Layout.fillWidth: true
			Layout.fillHeight: true
			text: qsTr("Saturation")
			value: initialColor.hslSaturation
		}

		LabeledSlider {
			id: sliderL

			Layout.fillWidth: true
			Layout.fillHeight: true
			text: qsTr("Lightness")
			value: initialColor.hslLightness
		}
	}
}
