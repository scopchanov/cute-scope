#ifndef VALIDATORREQUIRED_H
#define VALIDATORREQUIRED_H

#include "AbstractValidator.h"

//Validators
//	min(min: number)
//	max(max: number)
//	required(control: AbstractControl)
//	requiredTrue(control: AbstractControl)
//	email(control: AbstractControl)
//	minLength(minLength: number)
//	maxLength(maxLength: number)
//	pattern(pattern: string | RegExp)

class ValidatorRequired : public AbstractValidator
{
	Q_OBJECT
public:
	explicit ValidatorRequired(QObject *parent = nullptr);

	bool valid(const QVariant &value) override;
};

#endif // VALIDATORREQUIRED_H
