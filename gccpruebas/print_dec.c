#include <stdarg.h>
#include "holberton.h"
/**
 *print_dec - prints integer
 *
 *@d: integer to print
 *
 *Return: integer
 */
int print_dec(va_list *d)
{
	int dig;
	long int num;
	int base;
	int count = 0;

	num = va_arg(*d, int);

	if (num < 0)
	{
		num *= -1;
		_putchar(45);
		count++;
	}
	if (num <= 9 && num >= 0)
	{
		_putchar(num + 48);
		count++;
	}

	if (num > 9)
	{
		base = 10;

		while (num / base > 9)
		{
			base *= 10;
		}
		while (base > 0)
		{
			dig = num / base;
			num = num % base;
			_putchar(dig + 48);
			base = base / 10;
			count++;
		}
	}
	return (count);
}
