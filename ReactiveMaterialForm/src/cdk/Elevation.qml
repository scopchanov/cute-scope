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
 * Elevation
 */

Item {
	id: root

	required property var source
	property int distance: 1

	anchors.fill: source

	Shadow {
		id: keyShadow

		source: root.source
		verticalOffset: 2; radius: 1.0; spread: 0; samples: 17
		color: Qt.rgba(0, 0, 0, 0.02)
	}

	Shadow {
		id: ambientShadow

		source: root.source
		verticalOffset: 1; radius: 1.0; spread: 0; samples: 17
		color: Qt.rgba(0, 0, 0, 0.14)
	}

	Shadow {
		id: fillShadow

		source: root.source
		verticalOffset: 1; radius: 3.0; spread: 0; samples: 17
		color: Qt.rgba(0, 0, 0, 0.12)
	}

	states: [
		State {
			when: distance === 2

			PropertyChanges {
				target: keyShadow; verticalOffset: 3; radius: 1.0
			}

			PropertyChanges {
				target: ambientShadow; verticalOffset: 2; radius: 2.0
			}

			PropertyChanges {
				target: fillShadow; verticalOffset: 1; radius: 5.0
			}
		},
		State {
			when: distance === 3

			PropertyChanges {
				target: keyShadow; verticalOffset: 3; radius: 3.0
			}

			PropertyChanges {
				target: ambientShadow; verticalOffset: 3; radius: 4.0
			}

			PropertyChanges {
				target: fillShadow; verticalOffset: 1; radius: 8.0
			}
		},
		State {
			when: distance === 4

			PropertyChanges {
				target: keyShadow; verticalOffset: 2; radius: 4.0
			}

			PropertyChanges {
				target: ambientShadow; verticalOffset: 4; radius: 5.0
			}

			PropertyChanges {
				target: fillShadow; verticalOffset: 1; radius: 10.0
			}
		},
		State {
			when: distance === 5

			PropertyChanges {
				target: keyShadow; verticalOffset: 3; radius: 5.0
			}

			PropertyChanges {
				target: ambientShadow; verticalOffset: 5; radius: 8.0
			}

			PropertyChanges {
				target: fillShadow; verticalOffset: 1; radius: 14.0
			}
		},
		State {
			when: distance === 6

			PropertyChanges {
				target: keyShadow; verticalOffset: 3; radius: 5.0
			}

			PropertyChanges {
				target: ambientShadow; verticalOffset: 6; radius: 10.0
			}

			PropertyChanges {
				target: fillShadow; verticalOffset: 1; radius: 18.0
			}
		},
		State {
			when: distance === 7

			PropertyChanges {
				target: keyShadow; verticalOffset: 4; radius: 5.0
			}

			PropertyChanges {
				target: ambientShadow; verticalOffset: 7; radius: 10.0
			}

			PropertyChanges {
				target: fillShadow; verticalOffset: 2; radius: 16.0
			}
		},
		State {
			when: distance === 8

			PropertyChanges {
				target: keyShadow; verticalOffset: 5; radius: 5.0
			}

			PropertyChanges {
				target: ambientShadow; verticalOffset: 8; radius: 10.0
			}

			PropertyChanges {
				target: fillShadow; verticalOffset: 3; radius: 14.0
			}
		}
	]
}
