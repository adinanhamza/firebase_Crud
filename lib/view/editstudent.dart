
import 'package:firebase_sample/model/model.dart';
import 'package:firebase_sample/viewmodel/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Update extends StatefulWidget {
  String id;
  String name;
  String age;
  String clas;
  String address;
    TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController classcontroller =  TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
   Update({super.key, required this.address,required this.age,required this.name,required this.id,required this.clas
   
   });

  @override
  State<Update> createState() => _updateState();
}

class _updateState extends State<Update> {
      TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController classcontroller =  TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  @override
  void initState(){
    namecontroller = TextEditingController(text: widget.name);
    agecontroller = TextEditingController(text: widget.age);
    classcontroller = TextEditingController(text: widget.clas);
    addresscontroller = TextEditingController(text: widget.address);

super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
        TextFormField(
          controller: namecontroller,
          validator: (value) {
            if(value==null|| value.isEmpty){
        return 'field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
        hintText: 'name',
        border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          controller: agecontroller,
          validator: (value) {
            if(value==null|| value.isEmpty){
        return 'field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
        hintText: 'age',
        border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          controller: classcontroller,
          validator: (value) {
            if(value==null|| value.isEmpty){
        return 'field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
        hintText: 'class',
        border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          controller: addresscontroller,
          validator: (value) {
            if(value==null|| value.isEmpty){
        return 'field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
        hintText: 'address',
        border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        Consumer<StudentProvider>(
          builder: (context, value, child) => 
          ElevatedButton(onPressed: (){
            value.updateStudent(StudentModel(address: addresscontroller.text, name: namecontroller.text, studentClass:classcontroller.text, age: agecontroller.text),widget.id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data updated successfully')));
            Navigator.pop(context);
          }, child: Text('submit'),),
        
        )
          ],
        ),
      ),
    ));
  }
}