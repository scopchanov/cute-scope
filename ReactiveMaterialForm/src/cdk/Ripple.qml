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

/*
 * Ripple
 */

Item {
	id: root

	visible: enabled

	property color color: "white"

	function start() {
		rippleLoader.active = true
	}

	implicitHeight: width

	Loader {
		id: rippleLoader

		anchors.fill: parent
		active: false

		sourceComponent: Rectangle {
			id: ripple

			signal completed()

			anchors.fill: parent
			radius: 0.5*width
			opacity: 0.25

			NumberAnimation {
				id: animation

				target: ripple
				property: "scale"
				from: 0.5; to: 2
				duration: 250
				easing.type: Easing.InOutQuad

				onFinished: ripple.completed()
			}

			Component.onCompleted: animation.start()
		}
	}

	Binding {
		target: rippleLoader.item
		property: "color"
		value: color
	}

	Connections {
		target: rippleLoader.item

		function onCompleted() {
			rippleLoader.active = false
		}
	}
}


