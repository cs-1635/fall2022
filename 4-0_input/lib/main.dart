import 'package:flutter/material.dart';
import 'package:input_example/login_form.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login form"),
        ),
        body: LayoutBuilder(
          builder: (context, dimensions) {
            final width = dimensions.maxWidth / 1.5;
            final height = dimensions.maxHeight / 2;

            return Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: LoginForm(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}