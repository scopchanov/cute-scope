#include "FormElement.h"
#include "FormElement_p.h"
#include <QDebug>

FormElement::FormElement(QQuickItem *parent) :
	QQuickItem(parent),
	m_ptr(new FormElementPrivate(this))
{
//	setActiveFocusOnTab(true);
	scopedFocusItem();
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

bool FormElement::pristine() const
{
	return m_ptr->pristine;
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

	m_ptr->setPristine(m_ptr->defaultValue == val);

	m_ptr->value = val;

	emit valueChanged();
}

void FormElement::init(const QJsonValue &val)
{
	m_ptr->value = val;
	m_ptr->defaultValue = val;

	valueChanged();
}

void FormElement::accept()
{
	m_ptr->defaultValue = m_ptr->value;
}

void FormElement::reject()
{

}

void FormElement::reset()
{
	setValue(m_ptr->defaultValue);
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

FormElementPrivate::FormElementPrivate(FormElement *parent) :
	p_ptr(parent),
	valid(false),
	pristine(true),
	touched(false)
{

}

void FormElementPrivate::setPristine(bool b)
{
	if (pristine == b)
		return;

	pristine = b;

	emit p_ptr->pristineChanged();
}
