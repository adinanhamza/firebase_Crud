import 'package:firebase_sample/viewmodel/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Consumer<StudentProvider>(
        builder: (context, value, child) => 
        
         Column(
          children: [
            
          ],
        ),
      ),
    ));
  }
}