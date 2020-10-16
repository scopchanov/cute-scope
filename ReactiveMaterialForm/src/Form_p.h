#ifndef FORM_P_H
#define FORM_P_H

#include <QtCore>

class Form;
class QQuickItem;

class FormPrivate {

	Q_DISABLE_COPY(FormPrivate);

	explicit FormPrivate();

	bool valid;
	bool invalid;
	bool pristine;
	bool dirty;
	bool submitted;
	QJsonObject value;
	qreal spacing;

	QQuickItem *lastItem;

	friend class Form;
};

#endif // FORM_P_H
