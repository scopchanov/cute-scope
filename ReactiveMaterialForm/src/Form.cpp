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

#include "Form.h"
#include "Form_p.h"
#include "FormElement.h"
#include <QJsonValue>
#include <QDebug>

Form::Form(QQuickItem *parent) :
	QQuickItem(parent),
	m_ptr(new FormPrivate(this))
{
	setFlag(ItemIsFocusScope);
}

bool Form::valid() const
{
	return m_ptr->valid;
}

bool Form::pristine() const
{
	return m_ptr->pristine;
}

bool Form::submitted() const
{
	return m_ptr->submitted;
}

QJsonObject Form::value() const
{
	QJsonObject json;

	for (auto *formElement : m_ptr->formElements)
		json.insert(formElement->objectName(), formElement->value());

	return json;
}

void Form::setValue(const QJsonObject &json)
{
	for (const QString &key : json.keys()) {
		auto *formElement = m_ptr->findFormElement(key);

		if (formElement)
			formElement->setValue(json.value(key));
	}

	emit valueChanged();
}

QQuickItem *Form::background() const
{
	return m_ptr->background;
}

void Form::setBackground(QQuickItem *item)
{
	if (m_ptr->background == item)
		return;

	m_ptr->background = item;
	m_ptr->background->setParentItem(this);

	emit backgroundChanged();
}

QQmlListProperty<FormElement> Form::formElements()
{
	return { this, this,
				&Form::appendElement,
				&Form::elementCount,
				&Form::element,
				&Form::clearElements,
				&Form::replaceElement,
				&Form::removeLastElement };
}

void Form::appendElement(FormElement *formElement)
{
	Q_ASSERT_X(m_ptr->background, "Append element", "Panel not specified.");

	m_ptr->formElements.append(formElement);

	formElement->setParentItem(m_ptr->background);

	QObject *attached = qmlAttachedPropertiesObject<Form>(formElement, true);

	if (attached)
		attached->property("form").setValue(QDate::fromString("1977.10.11"));

	connect(formElement, &FormElement::valueChanged,
			this, &Form::valueChanged);
	connect(formElement, &FormElement::pristineChanged,
			this, &Form::checkPristine);
	connect(formElement, &FormElement::validChanged,
			this, &Form::checkValid);
}

int Form::elementCount() const
{
	return m_ptr->formElements.count();
}

FormElement *Form::element(int n) const
{
	return m_ptr->formElements.at(n);
}

void Form::clearElements()
{
	m_ptr->formElements.clear();
}

void Form::replaceElement(int n, FormElement *formElement)
{
	m_ptr->formElements[n] = formElement;
}

void Form::removeLastElement()
{
	m_ptr->formElements.removeLast();
}

FormAttachedType *Form::qmlAttachedProperties(QObject *parent)
{
	return new FormAttachedType(parent);
}

void Form::init(const QJsonObject &json)
{
	for (const QString &key : json.keys()) {
		auto *formElement = findChild<FormElement *>(key);

		if (formElement)
			formElement->init(json.value(key));
	}

	valueChanged();
}

void Form::reset()
{
	for (auto *formElement : m_ptr->formElements)
		formElement->reset();
}

void Form::submit()
{
	qDebug() << value();
}

void Form::appendElement(QQmlListProperty<FormElement> *list,
						 FormElement *formElement)
{
	reinterpret_cast<Form *>(list->data)->appendElement(formElement);
}

int Form::elementCount(QQmlListProperty<FormElement> *list)
{
	return reinterpret_cast<Form *>(list->data)->elementCount();
}

FormElement *Form::element(QQmlListProperty<FormElement> *list, int n)
{
	return reinterpret_cast<Form *>(list->data)->element(n);
}

void Form::clearElements(QQmlListProperty<FormElement> *list)
{
	reinterpret_cast<Form *>(list->data)->clearElements();
}

void Form::replaceElement(QQmlListProperty<FormElement> *list, int n,
						  FormElement *formElement)
{
	reinterpret_cast<Form *>(list->data)->replaceElement(n, formElement);
}

void Form::removeLastElement(QQmlListProperty<FormElement> *list)
{
	reinterpret_cast<Form *>(list->data)->removeLastElement();
}

void Form::checkPristine()
{
	bool pristine = m_ptr->checkProperty("pristine");

	if (m_ptr->pristine == pristine)
		return;

	m_ptr->pristine = pristine;

	emit pristineChanged();
}

void Form::checkValid()
{
	bool valid = m_ptr->checkProperty("valid");

	if (m_ptr->valid == valid)
		return;

	m_ptr->valid = valid;

	emit validChanged();
}

FormPrivate::FormPrivate(Form *parent) :
	p_ptr(parent),
	background(nullptr),
	valid(false),
	invalid(false),
	pristine(true),
	dirty(false),
	submitted(false),
	spacing(6)
{

}

FormElement *FormPrivate::findFormElement(const QString &name)
{
	FormElement *formElement = nullptr;

	for (int n = 0; n < formElements.count() && !formElement; n++)
		if (formElements.at(n)->objectName() == name)
			formElement = formElements.at(n);

	return formElement;
}

bool FormPrivate::checkProperty(const QString &name)
{
	bool success = true;

	for (auto formElement : formElements)
		success &= formElement->property(name.toLatin1()).toBool();

	return success;
}

FormAttachedType::FormAttachedType(QObject *parent) :
	QObject(parent)
{

}

QDate FormAttachedType::form() const
{
	return m_form;
}

void FormAttachedType::setForm(QDate form)
{
	if (m_form == form)
		return;

	m_form = form;

	emit formChanged();
}
