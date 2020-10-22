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
