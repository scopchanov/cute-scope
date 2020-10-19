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
		verticalOffset: 2; radius: 1.0; spread: 0.4; samples: 25
		color: Qt.rgba(0, 0, 0, 0.2)
	}

	Shadow {
		id: ambientShadow

		source: root.source
		verticalOffset: 1; radius: 1.0; spread: 0.5; samples: 25
		color: Qt.rgba(0, 0, 0, 0.14)
	}

	Shadow {
		id: fillShadow

		source: root.source
		verticalOffset: 1; radius: 3.0; spread: 0.5; samples: 25
		color: Qt.rgba(0, 0, 0, 0.12)
	}

	states: [
		State {
			when: distance === 2

			PropertyChanges {
				target: keyShadow
				verticalOffset: 2; radius: 1.0; spread: 0.4; samples: 25
				color: Qt.rgba(0, 0, 0, 0.2)
			}

			PropertyChanges {
				target: ambientShadow
				verticalOffset: 1; radius: 1.0; spread: 0.5; samples: 25
				color: Qt.rgba(0, 0, 0, 0.14)
			}

			PropertyChanges {
				target: fillShadow
				verticalOffset: 1; radius: 3.0; spread: 0.5; samples: 25
				color: Qt.rgba(0, 0, 0, 0.12)
			}
		}
	]
}
