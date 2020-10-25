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
 * Field Label
 */

Text {
	id: root

	property bool highlighted: false
	property bool floating: false
	property bool error: false
	property real originY: 0

	y: originY
	padding: 0
	font.pointSize: 12
	color: palette.text
	transformOrigin: Item.TopLeft

	states: [
		State {
			name: "errorFloating"; extend: "floating"
			when: error && (floating || highlighted)

			PropertyChanges { target: root; color: "#F44336" }
		},
		State {
			name: "error"
			when: error

			PropertyChanges { target: root; color: "#F44336" }
		},
		State {
			name: "highlighted"; extend: "floating"
			when: highlighted

			PropertyChanges { target: root; color: palette.highlight }
		},
		State {
			name: "floating"
			when: floating

			PropertyChanges { target: root; y: 7; scale: 0.75 }
		}
	]

	transitions: Transition {
//		to: "highlighted"
		reversible: true

		ParallelAnimation {
			NumberAnimation {
				properties: "y, scale"
				duration: 150
				easing.type: Easing.InOutQuad
			}

			ColorAnimation {
				properties: "color"
				duration: 150
				easing.type: Easing.InOutQuad
			}
		}
	}
}
