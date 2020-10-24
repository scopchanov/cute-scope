import QtQuick 2.15

/*
 * Ripple
 */

Item {
	id: root

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


