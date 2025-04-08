import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/model/model.dart';

class StudentService {
  final CollectionReference fireBaseData = FirebaseFirestore.instance
      .collection('data');

  Future<void> addStudent(studentModel studentdata) async {
    try {
      log('add data : ${studentdata.name}');
      await fireBaseData.add(studentdata.toDataBase());
    } catch (e) {
      log('failed to add student data  : $e');
    }
  }

  Future<List<studentModel>> getStudentData()async{
    try {
      final QuerySnapshot snapshot = await fireBaseData.get();
      return snapshot.docs.map((doc)=> studentModel.fromDataBase(doc.data() as Map<String,dynamic>, doc.id)).toList();
    } catch (e) {
      log('failed to fetch student data  : $e' );
      throw Exception('error fetching data');
    }
  }

  Future<void> updateStudent(studentModel updatedStudent, String id) async {
    try {
      await fireBaseData.doc(id).update(updatedStudent.toDataBase());
      log('update student data : ${updatedStudent.id}');
    } catch (e) {
      log('failed to update student : $e');
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      await fireBaseData.doc(id).delete();
      log('successfully deleted student id :$id ');
    } on FirebaseException catch (e) {
      log('failed to delete student : $e');
    }
  }


}
