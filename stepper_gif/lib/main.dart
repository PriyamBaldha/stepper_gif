import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Stepper_gif(),
  ));
}

class Stepper_gif extends StatefulWidget {
  const Stepper_gif({Key? key}) : super(key: key);

  @override
  State<Stepper_gif> createState() => _Stepper_gifState();
}

class _Stepper_gifState extends State<Stepper_gif> {
  int initialStepperIndex = 0;
  dynamic radioGrpval = "v";
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> ProfileFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.lightBlueAccent,
                Colors.lightBlueAccent,
                Colors.greenAccent,
                Colors.greenAccent,
              ],
            ),
          ),
        ),
        leading: const Icon(Icons.arrow_back),
        title: const Text("Edit Your Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: ProfileFormkey,
              child: Stepper(
                onStepCancel: () {
                  setState(() {
                    if (initialStepperIndex > 0) {
                      initialStepperIndex--;
                    }
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (initialStepperIndex < 10) {
                      initialStepperIndex++;
                    }
                  });
                },
                currentStep: initialStepperIndex,
                steps: <Step>[
                  Step(
                    isActive: initialStepperIndex >= 0,
                    state: initialStepperIndex >= 1
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Profile Picture",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add profile photo",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: (Global.photoPath != null)
                                      ? FileImage(Global.photoPath!)
                                      : null,
                                  child: (Global.photoPath != null)
                                      ? const Text("")
                                      : const Text(
                                          "ADD",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Add Photo"),
                                        actions: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 50,
                                                child: ListTile(
                                                  onTap: () async {
                                                    XFile? pickedFile =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Global.photoPath = File(
                                                          pickedFile!.path);
                                                    });
                                                  },
                                                  title: const Text(
                                                      "Take Your Photo"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                child: ListTile(
                                                  onTap: () async {
                                                    XFile? pickedFile =
                                                        await _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery,
                                                    );
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Global.photoPath = File(
                                                          pickedFile!.path);
                                                    });
                                                  },
                                                  title: const Text(
                                                      "Chose From Gallary"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                child: TextButton(
                                                  onPressed: () async {
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Global.photoPath = null;
                                                    });
                                                  },
                                                  child: Row(
                                                    children: const [
                                                      Icon(Icons.delete),
                                                      Text(
                                                        "Delete Your Photo",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 1,
                    state: initialStepperIndex >= 2
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "NAME",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter name",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Priyam S Baldha",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 2,
                    state: initialStepperIndex >= 3
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Phone",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter phone number",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.call),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "9856412326",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 3,
                    state: initialStepperIndex >= 4
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter Email",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.email),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "test@gmail.com",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 4,
                    state: initialStepperIndex >= 5
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "DOB",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter date of birth",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.date_range),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "DD/MM/YYYY",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 5,
                    state: initialStepperIndex >= 6
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Gender",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Male",
                              groupValue: radioGrpval,
                              onChanged: (val) {
                                setState(() {
                                  radioGrpval = val;
                                });
                              },
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 17,
                                color: (radioGrpval == "Male")
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Female",
                              groupValue: radioGrpval,
                              onChanged: (val) {
                                setState(() {
                                  radioGrpval = val;
                                });
                              },
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 17,
                                color: (radioGrpval == "Female")
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 6,
                    state: initialStepperIndex >= 7
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Current location",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter current location ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.location_on),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Surat",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 7,
                    state: initialStepperIndex >= 8
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Nationality",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter Nationality",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.flag),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Indian",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 8,
                    state: initialStepperIndex >= 9
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Religion",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter religion",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.front_hand_outlined),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "hindu",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 9,
                    state: initialStepperIndex >= 10
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Language(s)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter language",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Gujarati",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 10,
                    state: initialStepperIndex >= 11
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text(
                      "Biography",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter biography",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.details_outlined),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "engineer,doctor",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
