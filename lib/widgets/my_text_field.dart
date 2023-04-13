import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController myController;
  final FormFieldValidator<String> validator;
  final void Function()? onTap;

  const MyTextField(
      {Key? key,
      required this.hintText,
      required this.inputType,
      required this.myController,
      required this.validator,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autofocus: false,
        controller: myController,
       // style: AppTextStyles.blackanova.alegreyaFieldTitle.copyWith(color: Colors.black),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          //hintText: hintText,
          labelText: hintText,
          //hintStyle: AppTextStyles.blackanova.alegreyaFieldTitle,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.circular(15.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.circular(15.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
