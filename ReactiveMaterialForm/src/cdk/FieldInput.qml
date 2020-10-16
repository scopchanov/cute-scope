import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
	id: fieldInput

	font { family: "Roboto"; pointSize: 12 }
	color: palette.windowText
	selectByMouse: true
	background: Rectangle { color: "transparent" }

	Keys.onEscapePressed: {
		console.log("reject")
	}

	onActiveFocusChanged: {
		if (!activeFocus) {
			if (focusReason !== Qt.OtherFocusReason) {
				isTouched = true;
			}
		} else if (focusReason === Qt.TabFocusReason
				|| focusReason === Qt.BacktabFocusReason) {
			selectAll();
		}
	}

	onEditingFinished: {
		console.log("changed")
	}
}
