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
