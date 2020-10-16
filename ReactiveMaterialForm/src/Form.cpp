#include "Form.h"
#include "Form_p.h"
#include "FormElement.h"
#include <QJsonValue>
#include <QDebug>

Form::Form(QQuickItem *parent) :
	QQuickItem(parent),
	m_ptr(new FormPrivate)
{
	childrenRect();
	connect(this, &Form::childrenRectChanged, [this](){
		setImplicitWidth(childrenRect().width());
		setImplicitHeight(childrenRect().height());
	});
}

bool Form::valid() const
{
	return m_ptr->valid;
}

bool Form::invalid() const
{
	return m_ptr->invalid;
}

bool Form::pristine() const
{
	return m_ptr->pristine;
}

bool Form::dirty() const
{
	return m_ptr->dirty;
}

bool Form::submitted() const
{
	return m_ptr->submitted;
}

QJsonObject Form::value() const
{
	QJsonObject json;

	for (auto *item : childItems())
		if (item->inherits("FormElement"))
			json.insert(item->objectName(),
						qobject_cast<FormElement *>(item)->value());

	return json;
}

void Form::setValue(const QJsonObject &json)
{
	for (const QString &key : json.keys()) {
		auto *formElement = findChild<FormElement *>(key);

		if (formElement)
			formElement->setValue(json.value(key));
	}

	emit valueChanged();
}

qreal Form::spacing() const
{
	return m_ptr->spacing;
}

void Form::setSpacing(qreal d)
{
	if (m_ptr->spacing == d)
		return;

	m_ptr->spacing = d;

	emit spacingChanged();
}

void Form::reset()
{
	for (auto *item : childItems())
		if (item->inherits("FormElement"))
			qobject_cast<FormElement *>(item)->reset();
}

void Form::submit()
{
	qDebug() << value();
}

void Form::itemChange(QQuickItem::ItemChange change,
					  const QQuickItem::ItemChangeData &value)
{
	switch (change) {
	case QQuickItem::ItemChildAddedChange: {
		auto *item = value.item;

		if (item->inherits("FormElement")) {
			auto *anchors = qvariant_cast<QObject *>(item->property("anchors"));

			anchors->setProperty("left", property("left"));
			anchors->setProperty("right", property("right"));
			anchors->setProperty("topMargin", m_ptr->spacing);

			if (m_ptr->lastItem)
				anchors->setProperty("top",
									 m_ptr->lastItem->property("bottom"));

			m_ptr->lastItem = item;

			connect(qobject_cast<FormElement *>(item),
					&FormElement::validChanged, this, &Form::checkValid);
		}

		break;
	}
	case QQuickItem::ItemChildRemovedChange:
		qDebug() << "removed" << value.item;
		break;
	default:
		break;
	}

	QQuickItem::itemChange(change, value);
}

void Form::checkValid()
{
	bool fieldsAreValid = true;

	for (auto item : childItems())
		fieldsAreValid &= item->property("valid").toBool();

	if (m_ptr->valid == fieldsAreValid)
		return;

	m_ptr->valid = fieldsAreValid;

	emit validChanged();
}

FormPrivate::FormPrivate() :
	valid(false),
	invalid(false),
	pristine(true),
	dirty(false),
	submitted(false),
	spacing(15),
	lastItem(nullptr)
{

}
