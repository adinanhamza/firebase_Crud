import 'dart:developer';

import 'package:firebase_sample/view/editstudent.dart';
import 'package:firebase_sample/viewmodel/provider.dart';
import 'package:firebase_sample/viewmodel/secondprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  String id;
  String name;
  String age;
  String clas;
  String address;
  Profile({
    super.key,
    required this.address,
    required this.age,
    required this.clas,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    log( "class : $clas");
    log(address);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('profile'),
          actions: [
            Row(
              children: [
                Consumer<Secondprovider>(
                  builder:
                      (context, value, child) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => Update(
                                    address: address,
                                    age: age,
                                    name: name,
                                    id: id,
                                    clas: clas,
                                  ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                ),
                Consumer<Secondprovider>(
                  builder:
                      (context, value, child) => IconButton(
                        onPressed: () {
                          value.deleteStudent(id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('data deleted successfully'),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.delete),
                      ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('name : ${name}'),
              SizedBox(height: 10),
              Text('age : ${age}'),
              SizedBox(height: 10),
              Text('class : ${clas}'),
              SizedBox(height: 10),
              Text('address : ${address}'),
              SizedBox(height: 30),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
