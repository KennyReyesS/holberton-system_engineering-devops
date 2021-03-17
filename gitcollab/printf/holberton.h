#ifndef HOLBERTON_H
#define HOLBERTON_H

#include <stdarg.h>

/**
 * struct printer - An structure for each format
 *
 * @format: character that represents the format
 * @func: function for each format
 */
typedef struct printer
{
	char format;
	int (*func)(va_list *);
} printer_t;

int _putchar(char c);
printer_t get_printer(char s);
int _printf(const char *format, ...);


int print_char(va_list *);
int print_string(va_list *);
int print_dec(va_list *d);
int print_binary(va_list *);
#endif
