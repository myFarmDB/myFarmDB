#ifndef SQLEXCEPTION_H
#define SQLEXCEPTION_H
#include <string>
using std::string;

#include <stdexcept>
using std::runtime_error;

class SQLException : public runtime_error
{
	public:
		SQLException(char * errorText) : runtime_error(errorText) {}

		SQLException(const string errorText) : runtime_error(errorText) {}
};

#endif
