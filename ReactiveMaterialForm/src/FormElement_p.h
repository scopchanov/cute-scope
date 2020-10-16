#ifndef FORMELEMENT_P_H
#define FORMELEMENT_P_H

#include <QtCore>

class FormElement;

class FormElementPrivate {

	Q_DISABLE_COPY(FormElementPrivate);

	explicit FormElementPrivate();

	bool valid;
	bool invalid;
	bool pristine;
	bool touched;
	QJsonValue value;

	friend class FormElement;
};

#endif // FORMELEMENT_P_H
