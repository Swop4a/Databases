#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <vector>
#include <algorithm>
#include <map>
#include <set>
#include <string>
#include <fstream>
#include "Calendar.h"

using namespace std;

#define ll long long
#define pii pair<int, int>
#define pb push_back
#define mp make_pair

string upd(int i) {
	if (i < 10)
		return '0' + to_string(i);
	else
		return to_string(i);
}

string rand_sex() {
	string s = "";
	rand() % 2 == 0 ? s += "ì" : s += "æ";
	return s;
}

string rand_phone() {
	string res;
	for (int i = 0; i < 10; ++i)
		res += char('0' + (rand() % 10));
	return res;
}

string rand_s(int l) {
	string s;
	l -= rand() % (l / 2);
	for (int i = 0; i < l; ++i)
		s += 'à' + (rand() % 32);
	return s;
}

string rand_numb(int l) {
	string s;
	for (int i = 0; i < l; ++i)
		s += '0' + (rand() % 10);
	return s;
}

string rand_date() {
	string s;
	s += upd(2013 + (rand() % 4)) + '-';
	s += upd(1 + (rand() % 12)) + '-';
	s += upd(1 + (rand() % 28));
	return s;
}

string rand_time() {
	return to_string(rand() % 24) + ':' + to_string(rand() % 60);
}

string cc(int t) {
	if (t < 10)
		return '0' + to_string(t);
	else
		return to_string(t);
}

string rand_date1() {
	int year = 2012 + (rand() % 5);
	int month = 1 + (rand() % 12);
	int day = 1 + (rand() % months[month - 1]);
	return to_string(year) + cc(month) + cc(day);
}

string rd(int a, int b) {
	return to_string(a + (rand() % (b - a)));
}

string gen_dimRecipe(int i) {
	string s;
	s += to_string(i + 1) + ','; // ID_Recipe
	s += rand_s(15) + ','; // Recipe_Name
	s += rd(1, 10) + ','; // Calories
	s += 'à' + (rand() % 5); // Recipe_Category
	return s;
}

string gen_dimLocation(int i) {
	string s;
	s += to_string(i) + ','; // ID_Location = some city code
	s += rand_s(15) + ','; // City_Name
	s += rand_numb(2) + ','; // Region_code
	s += rand_s(15) + ','; // Region_Name
	s += rand_numb(2) + ','; // Country_Code
	s += rand_s(15); // Country_Name
	return s;
}

string gen_dimOffice(int i) {
	string s;
	s += to_string(i) + ','; // ID_DataBase
	s += rd(0, 300) + ','; // ID_Location
	s += rand_s(15) + ','; // Office_Name
	s += rand_phone() + ','; // Phone
	s += rand_s(20) + ','; // Adress
	return s;
}

string gen_dimCook(int i) {
	string s;
	s += to_string(i) + ","; // ID_DataBase
	s += to_string(rand() % 10 + 1) + ","; // ID_Office
	s += rand_date() + ","; // Hire_Date
	s += rand_date() + ","; // Dismissal_Date
	s += rand_s(25) + ","; // FIO
	s += char('à' + (rand() % 4)); s += ","; // Post
	s += rand_sex(); // Sex
	return s;
}

string gen_dimClient(int i) {
	string s;
	s += to_string(i) + ','; // ID_DataBase
	s += rd(1, 40) + ','; // ID_Location
	s += rd(1, 10) + ','; // ID_ClientCategory
	s += rand_s(25) + ','; // FIO
	s += rand_date() + ','; // Register_Date
	s += rd(0, 5000) + ','; // MoneySpent
	s += rd(0, 20) + ','; // Purchases_Count
	s += rand_s(20) + ','; // Adress
	s += rand_date() + ','; // Birthday
	s += rand_sex() + ','; // Sex
	return s;
}

string gen_dimClientCategory(int i) {
	string s;
	s += to_string(18 + (rand() % 90)) + ','; // Age
	s += rand_sex() + ','; // Sex
	s += to_string(8000 + rand()) + ','; // Earnings
	s += char('a' + (rand() % 4)); s += ","; // Martial_Status
	s += to_string(rand() % 4); // Children_Count
	return s;
}

string gen_FastPurchases(int i) {
	string s;
	s += rd(0, 3000) + ','; // id cheque
	s += rd(0, 300) + ','; // id location (0-300)
	s += rd(0, 350) + ','; // id office (0-299)
	s += rd(0, 650) + ','; // id client (0-599)
	s += rd(50, 2000) + ','; // price
	s += rd(0, 450) + ','; // id cook (0-399)
	s += rd(1, 350) + ','; // id recipe (1-300)
	s += rand_date() + ','; // id date
	s += rd(1, 11) + ','; // id client category (1-11)
	s += rd(1, 20); // quantity
	return s;
}

void main() {

#ifdef _DEBUG 
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
#endif

	setlocale(LC_ALL, "Russian");

	//genCalendar(2013, 2017);

	vector<string> r;
	for (int i = 0; i < 3000; ++i)
		r.push_back(gen_FastPurchases(i));
	for (string s : r)
		cout << s << endl;
}