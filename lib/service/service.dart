import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/model/model.dart';

class StudentService {
  final CollectionReference fireBaseData = FirebaseFirestore.instance
      .collection('data');

  Future<void> addStudent(StudentModel studentdata) async {
    try {
      log('add data : ${studentdata.name}');
      await fireBaseData.add(studentdata.toDataBase());
    } catch (e) {
      log('failed to add student data  : $e');
    }
  }

  Future<List<StudentModel>> getStudentData()async{
    try {
      final QuerySnapshot snapshot = await fireBaseData.get();
      // log('id : $doc')
      return snapshot.docs.map((doc)=> StudentModel.fromDataBase(doc.data() as Map<String,dynamic>, doc.id)).toList();
      
    } catch (e) {
      log('failed to fetch student data  : $e' );
      throw Exception('error fetching data');
    }
  }

  Future<void> updateStudent(StudentModel updatedStudent, String id) async {
    try {
      await fireBaseData.doc(id).update(updatedStudent.toDataBase());
      log('update student data : ${updatedStudent.id}');
    } catch (e) {
      log('failed to update student : $e');
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      log('id $id');
      await fireBaseData.doc(id).delete();
      log('successfully deleted student id :$id ');
    } on FirebaseException catch (e) {
      
      throw Exception('error : $e');

    }
    
    
  }


}
