import 'package:flutter/material.dart';

class CallMethod extends StatefulWidget {
  const CallMethod({super.key});

  @override
  State<CallMethod> createState() => _CallMethodState();
}

class _CallMethodState extends State<CallMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Call method"),
    );
  }
}
