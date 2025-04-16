import 'dart:developer';
import 'package:firebase_sample/model/model.dart';
import 'package:firebase_sample/service/service.dart';
import 'package:flutter/material.dart';

class Secondprovider extends ChangeNotifier{
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController classcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  List <StudentModel> studentList = [];
  StudentService service = StudentService();


  void addData()async{

   try {
      await service.addStudent(StudentModel(address:addresscontroller.text, name: namecontroller.text, studentClass: classcontroller.text, age:agecontroller.text));

   } catch (e) {
     log('erorr in pro add data : $e');

      }
      namecontroller.clear();
     agecontroller.clear();
     addresscontroller.clear();
     classcontroller.clear();
     getData();
     notifyListeners();
  
  }

  void getData()async{
    try {
     studentList =  await service.getStudentData();
     if(studentList.isNotEmpty){
 log('student get data in pro succes');
     }
     
    } catch (e) {
      log('error in student get data in pro');
    }
    notifyListeners();
  }

  void updateStudent(StudentModel updatedStudent , String id)async{
    try {
      await service.updateStudent(updatedStudent, id);
    } catch (e) {
      log('error in updated student in pro : $e');
    }
    getData();
    notifyListeners();
  }

  void deleteStudent(String id)async{
    try {
      await service.deleteStudent(id);
      log('deleted successfully');
    } catch (e) {
      log('error in deleted student in pro :$e');
    }
    getData();
    notifyListeners();
  }
}