import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/model/model.dart';
import 'package:flutter/material.dart';

class SecondService{


  final CollectionReference fireBaseData =  FirebaseFirestore.instance.collection('data');

  Future<void>addStudent(StudentModel student)async{
    try {
      log('added  student data :${student.toString()} ');
      await fireBaseData.add(student.toDataBase());
    } catch (e) {
      log('error in add student data ');
    }
  }

  Future<List<StudentModel>> getStudentData()async{
    try {
  final QuerySnapshot snapshot =  await fireBaseData.get();
log('get student data success ${snapshot.docs.toString()}');
  return snapshot.docs.map((doc)=> StudentModel.fromDataBase(doc.data() as Map<String,dynamic>, doc.id)).toList();
  
    } catch (e) {
      log('error in get data : $e');
      throw Exception('error in fetching data : $e');
    }
  }

  Future<void>updateStudent(StudentModel updatedStudent,String id)async{
    try {
      await fireBaseData.doc(id).update(updatedStudent.toDataBase());
      log('updated student success $id');
    } catch (e) {
      log('error in update student :$e');
    }
  }

  Future<void>deleteStudent(String id)async{
    try {
      await fireBaseData.doc(id).delete();
      log('delete student success : $id');
    } catch (e) {
      log('delete student failed : $e');
    }
  }
}