/**
MIT License

Copyright (c) 2020 Michael Scopchanov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include "FormElement.h"
#include "FormElement_p.h"
#include "AbstractValidator.h"
#include <QDebug>

FormElement::FormElement(QQuickItem *parent) :
	QQuickItem(parent),
	m_ptr(new FormElementPrivate(this))
{

}

bool FormElement::valid() const
{
	return m_ptr->valid;
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

	m_ptr->setValid(m_ptr->checkValid());
}

QQmlListProperty<AbstractValidator> FormElement::validators()
{
	return { this, &m_ptr->validators };
}

void FormElement::componentComplete()
{
	QQuickItem::componentComplete();

	m_ptr->valid = m_ptr->checkValid();
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

void FormElementPrivate::setValid(bool b)
{
	if (valid == b)
		return;

	valid = b;

	emit p_ptr->validChanged();
}

bool FormElementPrivate::checkValid()
{
	bool isValid = true;

	for (auto *validator : validators)
		isValid &= validator->valid(value);

	return isValid;
}
