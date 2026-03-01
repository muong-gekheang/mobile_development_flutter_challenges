import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SERVICES

class StudentsService {
  String getStudents() => "Students loaded";
}

class CourseService {
  String getCourses() => "Courses loaded";
}

class GradesService {
  String getGrades() => "Grades loaded";
}

// GLOBAL SERVICES INSTANCES

// StudentsService globalStudentsService = StudentsService();
// CourseService globalCourseService = CourseService();
// GradesService globalGradesService = GradesService();

// MAIN ---------------------------------------

void main() {
  runApp(MaterialApp(home: App()));
}

// UI
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("School App - Global Services")),
      body: Provider<StudentsService>(
        create: (_) => StudentsService(),
        child: Provider<CourseService>(
          create: (_) => CourseService(),
          child: Provider<GradesService>(
            create: (_) => GradesService(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                StudentsScreen(),
                CoursesScreen(),
                GradesScreen(),
                SettingsScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Direct global access
    // final data = globalStudentsService.getStudents();
    final studentsService = context.read<StudentsService>();
    final data = studentsService.getStudents();

    return Text("StudentsScreen → $data");
  }
}

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseService = context.read<CourseService>();
    final data = courseService.getCourses();

    return Text("CoursesScreen → $data");
  }
}

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gradesService = context.read<GradesService>();
    final studentsService = context.read<StudentsService>();
    final coursesService = context.read<CourseService>();

    final grades = gradesService.getGrades();
    final students = studentsService.getStudents();
    final courses = coursesService.getCourses();


    return Text("GradesScreen → $grades for $students for $courses");
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Seeting");
  }
}
