import 'package:flutter/material.dart';
import 'package:lung_sense/analysis.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String _gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Beyond the Basics.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Text(
            "Input Your Details for Personalized Lung Cancer Risk Evaluation",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0))),
                    ),
                    const SizedBox(height: 32.0),
                    TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                          labelText: 'Age',
                          hintText: 'Enter your age',
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0))),
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        DropdownMenu(
                            controller: _weightController,
                            dropdownMenuEntries: const [
                              DropdownMenuEntry(
                                  label: "60-70 kg", value: "60-70 kg"),
                              DropdownMenuEntry(
                                  label: "70-80 kg", value: "70-80 kg"),
                              DropdownMenuEntry(
                                  label: "80-90 kg", value: "80-90 kg"),
                              DropdownMenuEntry(
                                  label: "90-100 kg", value: "90-100 kg"),
                              DropdownMenuEntry(
                                  label: "100-110 kg", value: "100-110 kg"),
                            ]),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 32.0),
                        Row(children: [
                          Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: _gender == "Male" ? Colors.black : null,
                                border: _gender == "Male"
                                    ? null
                                    : const Border.fromBorderSide(
                                        BorderSide(color: Colors.black)),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _gender = "Male";
                                    });
                                  },
                                  child: Text(
                                    "Male",
                                    style: TextStyle(
                                        color: _gender == "Male"
                                            ? Colors.white
                                            : Colors.black),
                                  ))),
                          Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: _gender == "Female" ? Colors.black : null,
                              border: _gender == "Female"
                                  ? null
                                  : const Border.fromBorderSide(
                                      BorderSide(color: Colors.black)),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _gender = "Female";
                                });
                              },
                              child: Text("Female",
                                  style: TextStyle(
                                      color: _gender == "Female"
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          )
                        ]),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Analysis()),
                              );
                            },
                            child: const Text(
                              "Start",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ))),
                  ])),
        ]),
      ),
    );
  }
}
