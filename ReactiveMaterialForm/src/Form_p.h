#ifndef FORM_P_H
#define FORM_P_H

#include <QtCore>

class Form;
class QQuickItem;

class FormPrivate {

	Q_DISABLE_COPY(FormPrivate);

	explicit FormPrivate(Form *parent);

	bool checkFieldsProperty(const QString &name);

	Form *p_ptr;

	QQuickItem *formLayout;
	bool valid;
	bool invalid;
	bool pristine;
	bool dirty;
	bool submitted;
	qreal spacing;

	friend class Form;
};

#endif // FORM_P_H
