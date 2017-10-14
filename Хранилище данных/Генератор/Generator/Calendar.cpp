#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include "Calendar.h"

using namespace std;

string reformat(string s) {
	if ('1' <= s[0] && s[0] <= '9' && s.length() == 1)
		s = '0' + s;
	return s;
}

void genCalendar(int start_year, int end_year) {
	for (int i = start_year; i <= end_year; ++i)
		for (int j = 0; j < 12; ++j)
			for (int k = 1; k < months[j]; ++k) {
				string y = to_string(i);
				string m = to_string(j + 1);
				string d = to_string(k);
				cout << y + reformat(m) + reformat(d) + ' ' + y + ' ' + m + ' ' + d << endl;
			}		
}