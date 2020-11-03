#include "ValidatorRequired.h"
#include <QVariant>

ValidatorRequired::ValidatorRequired(QObject *parent) :
	AbstractValidator(parent)
{

}

bool ValidatorRequired::valid(const QVariant &value)
{
	return !value.toString().isEmpty();
}

