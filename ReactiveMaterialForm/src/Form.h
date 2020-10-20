#ifndef FORM_H
#define FORM_H

#include <QQuickItem>
#include <QJsonObject>

//	valid: This property returns true if the element’s contents are valid and false otherwise.
//	invalid: This property returns true if the element’s contents are invalid and false otherwise.

//	pristine: This property returns true if the element’s contents have not been changed.

//	dirty: This property returns true if the element’s contents have been changed.
//	untouched: This property returns true if the user has not visited the element.
//	touched: This property returns true if the user has visited the element.

// @property {boolean} $untouched True if control has not lost focus yet.
// @property {boolean} $touched True if control has lost focus.
// @property {boolean} $pristine True if user has not interacted with the control yet.
// @property {boolean} $dirty True if user has already interacted with the control.

// The form content is valid
// The form content is not valid
// No fields have been modified yet
// One or more have been modified
// The form is submitted


class FormAttachedType : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QDate form READ form WRITE setForm NOTIFY formChanged)
	QML_ANONYMOUS
public:
	FormAttachedType(QObject *parent);

	QDate form() const;
	void setForm(QDate form);

private:
	QDate m_form;

signals:
	void formChanged();
};

//class Form;
class FormPrivate;
class FormElement;

class Form : public QQuickItem
{
	Q_OBJECT
	Q_PROPERTY(bool valid READ valid NOTIFY validChanged)
	Q_PROPERTY(bool pristine READ pristine NOTIFY pristineChanged)
	Q_PROPERTY(bool submitted READ submitted NOTIFY submittedChanged)
	Q_PROPERTY(QJsonObject value READ value WRITE setValue NOTIFY valueChanged)
	Q_PROPERTY(QQuickItem *background READ background WRITE setBackground
			   NOTIFY backgroundChanged REQUIRED)
	Q_PROPERTY(QQmlListProperty<FormElement> formElements READ formElements)
	QML_ATTACHED(FormAttachedType)
	Q_CLASSINFO("DefaultProperty", "formElements")
	QML_ELEMENT
public:
	explicit Form(QQuickItem *parent = nullptr);

	bool valid() const;
	bool pristine() const;
	bool submitted() const;
	QJsonObject value() const;
	void setValue(const QJsonObject &json);

	QQuickItem *background() const;
	void setBackground(QQuickItem *item);

	QQmlListProperty<FormElement> formElements();
	void appendElement(FormElement *formElement);
	int elementCount() const;
	FormElement *element(int n) const;
	void clearElements();
	void replaceElement(int n, FormElement *formElement);
	void removeLastElement();

	static FormAttachedType *qmlAttachedProperties(QObject *parent);

public slots:
	void init(const QJsonObject &json);
	void reset();
	void submit();

private:
	static void appendElement(QQmlListProperty<FormElement> *list,
							  FormElement *formElement);
	static int elementCount(QQmlListProperty<FormElement> *list);
	static FormElement* element(QQmlListProperty<FormElement> *list, int n);
	static void clearElements(QQmlListProperty<FormElement> *list);
	static void replaceElement(QQmlListProperty<FormElement> *list, int n,
							 FormElement *formElement);
	static void removeLastElement(QQmlListProperty<FormElement> *list);

	FormPrivate *m_ptr;

private slots:
	void checkPristine();
	void checkValid();

signals:
	void validChanged();
	void pristineChanged();
	void submittedChanged();
	void valueChanged();
	void backgroundChanged();
};

#endif // FORM_H
