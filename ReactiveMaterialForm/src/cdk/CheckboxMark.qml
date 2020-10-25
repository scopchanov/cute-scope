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
import QtQuick.Shapes 1.15

/*
 * CheckBox Mark
 */

Shape {
	id: root

	width: 12; height: 12

	ShapePath {
		strokeWidth: 2
		strokeColor: palette.buttonText
		fillColor: "transparent"
		capStyle: ShapePath.RoundCap
		joinStyle: ShapePath.RoundJoin
		startX: 0; startY: 0
		scale: Qt.size(0.5, 0.5)

		PathSvg { path: "M1.73,12.91 8.1,19.28 22.79,4.59" }
	}

	states: State {
		name: "visible"
		when: root.visible
	}

	transitions: [
		Transition {
			to: "visible"

			SequentialAnimation {
				PropertyAction {
					target: root
					property: "visible"
					value: true
				}

				NumberAnimation {
					target: root
					property: "opacity"
					from: 0.0; to: 1.0
					duration: 150
					easing.type: Easing.InOutQuad
				}
			}
		}
	]
}
