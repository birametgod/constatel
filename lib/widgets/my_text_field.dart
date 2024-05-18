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
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        autofocus: false,
        controller: myController,
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.white
        ),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.3),
          contentPadding: const EdgeInsets.all(10),
          //hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.white
          ),
          //hintStyle: AppTextStyles.blackanova.alegreyaFieldTitle,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
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
                width: 2,
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.circular(15.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.lightBlueAccent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
