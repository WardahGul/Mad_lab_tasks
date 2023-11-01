import 'package:flutter/material.dart';
import 'package:flutter_application_5/FormDataModel.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    final FormDataModel formData =
        ModalRoute.of(context)!.settings.arguments as FormDataModel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Signup Data"),
      ),
      body: Card(
        child: Column(
          children: [
            Text("Username: ${formData.name}"),
            Text("Email: ${formData.email}"),
            Text("Gender: ${formData.Gender}"),
            Text("Date of Birth: ${formData.dob}"),
          ],
        ),
      ),
    );
  }
}
