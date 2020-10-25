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

#ifndef FORMELEMENT_H
#define FORMELEMENT_H

#include <QQuickItem>
#include <QJsonValue>

class FormElementPrivate;

class FormElement : public QQuickItem
{
	Q_OBJECT
	Q_PROPERTY(bool valid READ valid WRITE setValid NOTIFY validChanged)
	Q_PROPERTY(bool pristine READ pristine NOTIFY pristineChanged)
	Q_PROPERTY(bool touched READ touched WRITE setTouched NOTIFY touchedChanged)
	Q_PROPERTY(QJsonValue value READ value WRITE setValue NOTIFY valueChanged)
	QML_ELEMENT
public:
	explicit FormElement(QQuickItem *parent = nullptr);

	bool valid() const;
	void setValid(bool b);
	bool pristine() const;
	bool touched() const;
	void setTouched(bool b);
	QJsonValue value() const;
	void setValue(const QJsonValue &val);

public slots:
	void init(const QJsonValue &val);
	void accept();
	void reject();
	void reset();
	void clear();

protected:
	void focusInEvent(QFocusEvent *event) override;
	void focusOutEvent(QFocusEvent *event) override;

private:
	FormElementPrivate *m_ptr;

signals:
	void validChanged();
	void invalidChanged();
	void pristineChanged();
	void touchedChanged();
	void valueChanged();
};

#endif // FORMELEMENT_H
