#ifndef FORM_P_H
#define FORM_P_H

#include <QtCore>
#include <QQmlListProperty>

class QQuickItem;
class Form;
class FormElement;

class FormPrivate {

	Q_DISABLE_COPY(FormPrivate);

	explicit FormPrivate(Form *parent);

	FormElement *findFormElement(const QString &name);
	bool checkProperty(const QString &name);

	Form *p_ptr;

	QQuickItem *background;
	bool valid;
	bool invalid;
	bool pristine;
	bool dirty;
	bool submitted;
	qreal spacing;
	QVector<FormElement *> formElements;

	friend class Form;
};

#endif // FORM_P_H
