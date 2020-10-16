#include "FormElement.h"
#include "FormElement_p.h"
#include <QDebug>

FormElement::FormElement(QQuickItem *parent) :
	QQuickItem(parent),
	m_ptr(new FormElementPrivate)
{

}

bool FormElement::valid() const
{
	return m_ptr->valid;
}

void FormElement::setValid(bool b)
{
	if (m_ptr->valid == b)
		return;

	m_ptr->valid = b;

	emit validChanged();
}

bool FormElement::invalid() const
{
	return m_ptr->invalid;
}

bool FormElement::pristine() const
{
	return m_ptr->pristine;
}

void FormElement::setPristine(bool b)
{
	if (m_ptr->pristine == b)
		return;

	m_ptr->pristine = b;

	emit pristineChanged();
}

bool FormElement::touched() const
{
	return m_ptr->touched;
}

void FormElement::setTouched(bool b)
{
	if (m_ptr->touched == b)
		return;

	m_ptr->touched = b;

	emit touchedChanged();
}

QJsonValue FormElement::value() const
{
	return m_ptr->value;
}

void FormElement::setValue(const QJsonValue &val)
{
	if (m_ptr->value == val)
		return;

	m_ptr->value = val;

	emit valueChanged();
}

void FormElement::reset()
{
	setValue(QJsonValue());
}

void FormElement::clear()
{
	setValue(QJsonValue());
}

void FormElement::focusInEvent(QFocusEvent *event)
{
	qDebug() << "in:" << event->reason();
}

void FormElement::focusOutEvent(QFocusEvent *event)
{
	qDebug() << "out:" << event->reason();
}

FormElementPrivate::FormElementPrivate() :
	valid(false),
	invalid(false),
	pristine(true),
	touched(false)
{

}
