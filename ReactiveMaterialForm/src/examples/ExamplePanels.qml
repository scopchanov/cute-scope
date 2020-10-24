import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Scope.ReactiveForms 1.0
import "../cdk"
import "../components"

ColumnLayout {
	id: root

	Item {
		Layout.fillHeight: true
	}

	Flickable {
		id: flickable

		Layout.fillWidth: true
		Layout.fillHeight: true
		contentWidth: columnLayout.width
		contentHeight: columnLayout.height
		flickableDirection: Flickable.VerticalFlick
		ScrollBar.vertical: ScrollBar {}

		ColumnLayout {
			id: columnLayout

			width: flickable.width
			spacing: 8

			SExpansionPanel {
				Layout.fillWidth: true
				title: qsTr("Small form")
				subtitle: qsTr("Our parents")

				Form {
					id: form

					Layout.fillWidth: true
					implicitHeight: background.implicitHeight

					SLineEdit {
						id: property2

						Layout.fillWidth: true
						objectName: "property2"
						labelText: qsTr("Optional text property")
						helperText: qsTr("Type \"enable\" to enable the next field")
					}

					background: ColumnLayout {
						width: parent.width
						spacing: 15
					}
				}
			}

			SExpansionPanel {
				Layout.fillWidth: true
				title: qsTr("Family")
				subtitle: qsTr("Our parents")

				TextField {
					Layout.fillWidth: true
					text: "Misho"
				}

				TextField {
					Layout.fillWidth: true
					text: "Sisi"
				}

				TextField {
					Layout.fillWidth: true
					text: "Pise"
				}
			}

			SExpansionPanel {
				Layout.fillWidth: true
				title: qsTr("Siblings")
				subtitle: qsTr("Our parents")

				TextField {
					Layout.fillWidth: true
					text: "Cveti"
				}

				TextField {
					Layout.fillWidth: true
					text: "Vidi"
				}

				TextField {
					Layout.fillWidth: true
					text: "Ico"
				}
			}
		}
	}

	Item {
		Layout.fillHeight: true
	}
}
