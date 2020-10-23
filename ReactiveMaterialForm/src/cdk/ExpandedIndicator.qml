import QtQuick 2.15
import QtQuick.Layouts 1.12

Image {
	id: root

	property bool expanded: false

	states: State {
		name: "expanded"
		when: expanded

		PropertyChanges { target: root; rotation: 180 }
	}

	transitions: [
		Transition {
			to: "expanded"

			RotationAnimation {
				duration: 250
				direction: RotationAnimation.Clockwise
				easing.type: Easing.InOutQuad
			}
		},
		Transition {
			from: "expanded"

			RotationAnimation {
				duration: 250
				direction: RotationAnimation.Counterclockwise
				easing.type: Easing.InOutQuad
			}
		}
	]
}
