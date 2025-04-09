import 'package:firebase_sample/service/authServices.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController otp = TextEditingController();

  final AuthServices _authService = AuthServices();

  String? _verificationId;
  bool _otpSent = false;

  void _sendOTP() async {
    final number = phoneNumber.text.trim();

    if (number.isEmpty) return;

    await _authService.verifyPhoneNumber(
      phoneNumber: number,
      codeSentCallback: (verificationId) {
        setState(() {
          _otpSent = true;
          _verificationId = verificationId;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP sent successfully")),
        );
      },
      onFailed: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: $error")),
        );
      },
    );
  }

  void _verifyOTP() async {
    final enteredOtp = otp.text.trim();
    if (enteredOtp.isEmpty) return;

    final user = await _authService.verifyOTP(enteredOtp);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Logged in successfully")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Phone Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: phoneNumber,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number (+91xxxxxxxxxx)",
              ),
            ),
            const SizedBox(height: 20),
            if (_otpSent)
              TextField(
                controller: otp,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Enter OTP"),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _otpSent ? _verifyOTP : _sendOTP,
              child: Text(_otpSent ? "Verify OTP" : "Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
