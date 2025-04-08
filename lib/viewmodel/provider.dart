import 'dart:developer';

import 'package:firebase_sample/model/model.dart';
import 'package:firebase_sample/service/service.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier{
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController classcontroller =  TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  StudentService studentService = StudentService();
  List<studentModel> studentList = [];


  void addData()async{
    try {
      studentService.addStudent(studentModel(address: addresscontroller.text, name: namecontroller.text, studentClass: classcontroller.text));
    } catch (e) {
      log('add student in provider failed : $e');

    }
    namecontroller.clear();
    agecontroller.clear();
    classcontroller.clear();
    addresscontroller.clear();
    getData();
    notifyListeners();
  }

  void getData()async{
    studentList = await studentService.getStudentData();
    if(studentList.isNotEmpty){
      log('student data get success');

    }
    notifyListeners();
  }

  void updateStudent(studentModel updatedStudent,String id)async{
studentService.updateStudent(updatedStudent, id);
getData();
notifyListeners();
  }

  void deleteStudent(String id)async{
    studentService.deleteStudent(id);
    getData();
    notifyListeners();
  }
}