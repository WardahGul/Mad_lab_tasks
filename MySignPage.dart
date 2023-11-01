import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_application_5/FormDataModel.dart';

class MySignPage extends StatefulWidget {
  const MySignPage({super.key});

  @override
  State<MySignPage> createState() => _MySignPageState();
}

class _MySignPageState extends State<MySignPage> {
  TextEditingController pcontroller = TextEditingController();
  TextEditingController cpcontroller = TextEditingController();
  TextEditingController ucontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  String gender = 'male';
  // var size,height,width;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    String name = '';
    String email = '';
    String dob = '';

    // Gender _selectedGender=Gender.male;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.pink[100],
        centerTitle: true,
        title: const Text("Signup Page"
            // style: TextStyle(color: Colors.black),
            ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Image.asset(
            //   "assets/images/img1.jpg",
            //   width: 1000,
            //   height: 150,),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                    key: formkey,
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: ucontroller,
                            decoration: const InputDecoration(
                                labelText: "Username",
                                border: OutlineInputBorder()),
                            onChanged: (value) {
                              name;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter some text";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: emailcontroller,
                            decoration: const InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder()),
                            onChanged: (value) {
                              email;
                            },
                            validator: (value) {
                              final RegExp emailRegex = RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)*[a-zA-Z]{2,4}$');
                              if (value!.isEmpty) {
                                return "please enter some text";
                              }
                              if (!emailRegex.hasMatch(value)) {
                                return 'Email must be in format i-e abc@gmail.com';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: pcontroller,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.length < 8) {
                                return "Password should be greater than 8 ";
                              }
                              RegExp passwordRegex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                              if (!passwordRegex.hasMatch(value)) {
                                return '-Password must include uppercase,\n- lowercase, digit, and special character';
                              }
                              return null;
                            },
                          ),
                          // TextFormField(
                          //   controller: cpcontroller,
                          //   obscureText: true,
                          //   decoration: const InputDecoration(
                          //       labelText: "Confirm Password",
                          //       border: UnderlineInputBorder()),
                          //   validator: (value) {
                          //     if (value != pcontroller.text) {
                          //       return "Oops!Password doesn't match.";
                          //     }
                          //     return null;
                          //   },
                          // ),
                          Row(
                            children: [
                              const Text(
                                "Gender",
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio(
                                  value: "Male",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value!;
                                    });
                                  }),
                              const Text("Male"),
                              Radio(
                                  value: "Female",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value!;
                                    });
                                  }),
                              const Text("Female"),
                            ],
                          ),
                          // TextFormField(
                          //   controller: dobcontroller,
                          //   decoration: const InputDecoration(
                          //       labelText: "Date of Birth"),
                          //   onTap: () {
                          //     DatePicker.showDatePicker(
                          //       context,
                          //       showTitleActions: true,
                          //       minTime: DateTime(1900),
                          //       maxTime: DateTime.now(),
                          //       onConfirm: (date) {
                          //         setState(() {
                          //           dobcontroller.text =
                          //               DateFormat('dd-MM-yyyy').format(date);
                          //         });
                          //       },
                          //       currentTime: DateTime.now(),
                          //     );
                          //   },
                          // ),

                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            child: const Text("Register"),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                //it will check values of all fields wrt validator
                                // ScaffoldMessenger.of(context).showSnackBar(
                                // SnackBar(content: Text("Form Successfully submitted! ${ucontroller.text} and ${pcontroller.text}")));
                                // Future.delayed(const Duration(seconds: 3));
                                FormDataModel formData = FormDataModel(
                                    name: ucontroller.text,
                                    email: emailcontroller.text,
                                    Gender: gender,
                                    dob: dobcontroller.text);
                                Navigator.pushNamed(context, '/datapage',
                                    arguments: formData);
                              }
                            },
                          )
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
