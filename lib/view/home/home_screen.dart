import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../grid/view_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController rowController = TextEditingController();
  final TextEditingController columnController = TextEditingController();

  final TextEditingController valueController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBarWidget(title: 'MOBIGIC'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Text(
                  'Please Enter Number of Rows and Columns',
                  style: TextStyle(
                    color: kblackText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              kheight50,
              TextFormWidget(
                hintText: 'Number Of Rows',
                controller: rowController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please Enter NUmber';
                  } else if (value == '0') {
                    return ' please Enter Greater than Zero';
                  }
                },
              ),
              kheight20,
              TextFormWidget(
                hintText: 'Number Of columns',
                controller: columnController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please Enter NUmber';
                  } else if (value == '0') {
                    return ' please Enter Greater than Zero';
                  }
                },
              ),
              // kheight20,
              // TextFormWidget(
              //   hintText: 'please Enter the value',
              //   controller: valueController,
              //   validator: (String? value) {
              //     if (value!.isEmpty) {
              //       return 'Please Enter value';
              //     }
              //   },
              // ),
              kheight20,
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kblack,
                ),
                onPressed: () {
                  log('${rowController.text} this is row');
                  log('${columnController.text} this is column');
                  if (formKey.currentState!.validate()) {
                    Get.to(
                      () => ViewScreen(
                        row: rowController.text,
                        column: columnController.text,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text(
                  'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kblack,
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator});

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: kblack,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
      ),
    );
  }
}
