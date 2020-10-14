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
	font.pointSize: 11
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

			PropertyChanges { target: root; y: 5 }
			PropertyChanges { target: root; scale: 0.75 }
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
