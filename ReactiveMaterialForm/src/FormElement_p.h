#ifndef FORMELEMENT_P_H
#define FORMELEMENT_P_H

#include <QtCore>

class FormElement;

class FormElementPrivate {

	Q_DISABLE_COPY(FormElementPrivate);

	explicit FormElementPrivate(FormElement *parent);

	void setPristine(bool b);

	FormElement *p_ptr;

	bool valid;
	bool pristine;
	bool touched;
	QJsonValue value;
	QJsonValue defaultValue;

	friend class FormElement;
};

#endif // FORMELEMENT_P_H
