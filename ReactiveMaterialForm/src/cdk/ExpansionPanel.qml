import QtQuick 2.15

Item {
	id: root

	property bool expanded: true
	property real asd

	visible: false

	states: [
		State {
			name: "expanded"
			when: expanded

			PropertyChanges { target: root; visible: true }
		}
	]

	transitions: [
		Transition {
			from: "expanded"

			SequentialAnimation {
				PropertyAction {
					target: root
					property: "visible"
					value: true
				}

				ParallelAnimation {
					NumberAnimation {
						target: root
						property: "implicitHeight"
						to: 0.0
						duration: 250
						easing.type: Easing.InOutQuad
					}

					NumberAnimation {
						target: root
						property: "opacity"
						from: 1.0; to: 0.0
						duration: 250
						easing.type: Easing.InOutQuad
					}
				}

				PropertyAction {
					target: root
					property: "visible"
					value: false
				}
			}
		},
		Transition {
			to: "expanded"

			ParallelAnimation {
				NumberAnimation {
					target: root
					property: "implicitHeight"
					from: 0.0; to: asd
					duration: 250
					easing.type: Easing.InOutQuad
				}

				NumberAnimation {
					target: root
					property: "opacity"
					from: 0.0; to: 1.0
					duration: 250
					easing.type: Easing.InOutQuad
				}
			}
		}
	]
}
