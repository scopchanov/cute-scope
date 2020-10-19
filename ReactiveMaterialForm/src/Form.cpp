#include "Form.h"
#include "Form_p.h"
#include "FormElement.h"
#include <QJsonValue>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QDebug>

//auto *anchors = qvariant_cast<QObject *>(item->property("anchors"));
//anchors->setProperty("left", property("left"));
//anchors->setProperty("right", property("right"));
//anchors->setProperty("topMargin", m_ptr->spacing);

Form::Form(QQuickItem *parent) :
	QQuickItem(parent),
	m_ptr(new FormPrivate(this))
{
	setFlag(ItemIsFocusScope);
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

	for (auto *item : m_ptr->formLayout->childItems())
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
	for (auto *item : m_ptr->formLayout->childItems())
		if (item->inherits("FormElement"))
			qobject_cast<FormElement *>(item)->reset();
}

void Form::submit()
{
	qDebug() << value();
}

void Form::mousePressEvent(QMouseEvent *event)
{
	forceActiveFocus(Qt::MouseFocusReason);
	event->accept();
}

void Form::itemChange(ItemChange change,
					  const ItemChangeData &value)
{
	switch (change) {
	case ItemSceneChange:
		if (value.window) {
			auto *engine = qmlEngine(this);
			QQmlComponent compLayout(engine, this);

			compLayout.setData(QString("import QtQuick 2.15;"
									   "import QtQuick.Layouts 1.12;"
									   "ColumnLayout {"
									   "	anchors.fill: parent;"
									   "	spacing: %1;"
									   "}").arg(m_ptr->spacing).toLatin1(),
							   QUrl("formLayout"));

			m_ptr->formLayout = qobject_cast<QQuickItem *>(compLayout.create());

			engine->setObjectOwnership(m_ptr->formLayout,
									   QQmlEngine::JavaScriptOwnership);

			if (m_ptr->formLayout)
				m_ptr->formLayout->setParentItem(this);

			for (auto item : childItems())
				if (item->inherits("FormElement"))
					item->setParentItem(m_ptr->formLayout);

			connect(m_ptr->formLayout, &QQuickItem::implicitWidthChanged,
					this, &Form::onImplicitWidthChanged);
			connect(m_ptr->formLayout, &QQuickItem::implicitHeightChanged,
					this, &Form::onImplicitHeightChanged);
		}
		break;
	case ItemChildAddedChange: {
		auto *item = value.item;

		if (item->inherits("FormElement")) {
			auto *formElement = qobject_cast<FormElement *>(item);

			connect(formElement, &FormElement::valueChanged,
					this, &Form::valueChanged);
			connect(formElement, &FormElement::pristineChanged,
					this, &Form::checkPristine);
			connect(formElement, &FormElement::validChanged,
					this, &Form::checkValid);
		}

		break;
	}
	case ItemChildRemovedChange:
//		qDebug() << "removed" << value.item;
		break;
	default:
		break;
	}

	QQuickItem::itemChange(change, value);
}

void Form::checkPristine()
{
	bool pristine = m_ptr->checkFieldsProperty("pristine");

	if (m_ptr->pristine == pristine)
		return;

	m_ptr->pristine = pristine;

	emit pristineChanged();
}

void Form::checkValid()
{
	bool valid = m_ptr->checkFieldsProperty("valid");

	if (m_ptr->valid == valid)
		return;

	m_ptr->valid = valid;

	emit validChanged();
}

void Form::onImplicitWidthChanged()
{
	setWidth(qobject_cast<QQuickItem *>(sender())->implicitWidth());
}

void Form::onImplicitHeightChanged()
{
	setHeight(qobject_cast<QQuickItem *>(sender())->implicitHeight());
}

FormPrivate::FormPrivate(Form *parent) :
	p_ptr(parent),
	formLayout(nullptr),
	valid(false),
	invalid(false),
	pristine(true),
	dirty(false),
	submitted(false),
	spacing(6)
{

}

bool FormPrivate::checkFieldsProperty(const QString &name)
{
	if (!formLayout)
		return false;

	bool success = true;

	for (auto item : formLayout->childItems())
		success &= item->property(name.toLatin1()).toBool();

	return success;
}
