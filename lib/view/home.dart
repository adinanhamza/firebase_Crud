import 'package:firebase_sample/view/addstudent.dart';
import 'package:firebase_sample/view/profile.dart';
import 'package:firebase_sample/viewmodel/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context).getData();
    return SafeArea(child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Addstudent()));
      },
      child: Icon(Icons.add),
      
      ),
      appBar: AppBar(),
      body: Expanded(child: Consumer<StudentProvider>(
        builder: (context, value, child) => 
       ListView.builder(
          
          itemCount:value.studentList.length,
          itemBuilder: 
        
        (context, index) {
          final data = value.studentList[index];
          final docid = data.id;
          return ListTile(
            tileColor: Colors.grey,

            title: Text(data.name,style: TextStyle(
            
            ),),
            subtitle: Text(data.age),
            trailing: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Profile(address: data.address, age: data.age, clas: data.studentClass, name: data.name,id: docid!,)));
              
            }, icon: Icon(Icons.forward)),
          );
        }
        
        ),
      )),
    ));
  }
}