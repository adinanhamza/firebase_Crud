import 'package:firebase_sample/viewmodel/provider.dart';
import 'package:firebase_sample/viewmodel/secondprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addstudent extends StatelessWidget {
   TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController classcontroller =  TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
   Addstudent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Consumer<Secondprovider>(
        builder: (context, valuefield, child) => 
         Padding(
          padding: EdgeInsets.all(18),
           child: Column(
            children: [
              TextFormField(
                controller:valuefield.namecontroller ,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "feild is empty";
                    }
                    return null;
                  },decoration: InputDecoration(
                    hintText: 'name',border: OutlineInputBorder( )
                  ),
              ),
              SizedBox(height: 20,),TextFormField(
              
                controller:valuefield.agecontroller ,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "feild is empty";
                    }
                    return null;
                  },decoration: InputDecoration(
                    hintText: 'age',border: OutlineInputBorder( )
           ,
                  ),
                  
              ),
              SizedBox(height: 20,),TextFormField(
                controller:valuefield.classcontroller ,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "feild is empty";
                    }
                    return null;
                  },decoration: InputDecoration(
                    hintText: 'class',border: OutlineInputBorder( )
                  ),
              ),
              SizedBox(height: 20,),TextFormField(
                controller:valuefield.addresscontroller ,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "feild is empty";
                    }
                    return null;
                  },decoration: InputDecoration(
                    hintText: 'address',border: OutlineInputBorder( )
                  ),
              ),
              SizedBox(height: 20,),
              Consumer<Secondprovider>(
                builder: (context, value, child) => 
                 ElevatedButton(onPressed: (){
                  value.addData();
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data added successfully')));
               Navigator.pop(context);
                }, child: Text('add')),
              )
            ],
                   ),
         ),
      ),
    ));
  }
}