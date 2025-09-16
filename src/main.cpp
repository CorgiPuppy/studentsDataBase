#include <iostream>
#include <vector>
#include <string>
#include <fstream>

struct Student {
    std::string name;
    int age;
    std::string major;
    double gpa;
};

// Функция для добавления студента в базу данных
void addStudent(std::vector<Student>& database) {
    Student student;
    std::cout << "Введите имя студента: ";
    std::cin >> student.name;
    std::cout << "Введите возраст студента: ";
    std::cin >> student.age;
    std::cout << "Введите специальность студента: ";
    std::cin >> student.major;
    std::cout << "Введите средний балл студента: ";
    std::cin >> student.gpa;

    database.push_back(student);
    std::cout << "Студент добавлен в базу данных.\n";
}

// Функция для вывода всех студентов из базы данных
void displayStudents(const std::vector<Student>& database) {
    std::cout << "Список студентов:\n";
    for (const Student& student : database) {
        std::cout << "Имя: " << student.name << "\n";
        std::cout << "Возраст: " << student.age << "\n";
        std::cout << "Специальность: " << student.major << "\n";
        std::cout << "Средний балл: " << student.gpa << "\n\n";
    }
}

void createReport(const std::vector<Student>& database) {
	std::ofstream report;
	std::string reportFolder = "report/";
	system("mkdir report");
	report.open(reportFolder + "report.typ");
	report << "#set page(paper: \"a4\", margin: 2cm)\n"
	<< "#set text(font: (\"Times New Roman\", \"Libertinus Serif\"), size: 12pt)\n"
	<< "#set par(leading: 1.5em, justify: true)\n\n"
	<< "#align(center)[\n"
		<< "\t#text(weight: \"bold\", size: 16pt)[ОТЧЁТ]\n"
		<< "\t#linebreak()\n"
		<< "\t#text(style: \"italic\", size: 10pt)[Дата: #datetime.today().display(\"[day].[month].[year]\")]\n"
	<< "]\n";

	report.close();
}

int main() {
    std::vector<Student> database;

    int choice;
    do {
        std::cout << "Меню:\n";
        std::cout << "1. Добавить студента\n";
        std::cout << "2. Вывести список студентов\n";
		std::cout << "3. Создать отчёт\n";
        std::cout << "0. Выход\n";
        std::cout << "Выберите действие: ";
        std::cin >> choice;

        switch (choice) {
            case 1:
                addStudent(database);
                break;

            case 2:
                displayStudents(database);
                break;

            case 3:
                createReport(database);
                break;

            case 0:
                std::cout << "Выход из программы.\n";
                break;

            default:
                std::cout << "Неверный выбор. Попробуйте снова.\n";
        }
    } while (choice != 0);

    return 0;
}
