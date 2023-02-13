import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatelessWidget {
  final Widget? Preffix;
  final String HintText;
  final TextEditingController Controller;
  final String? Function(String?)? ControllerValidator;
  final String? textError;

  const InputForm({
    super.key,
    required this.HintText,
    required this.Controller,
    this.Preffix,
    this.ControllerValidator,
    this.textError,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          HintText,
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: Controller,
          autocorrect: false,
          validator: ControllerValidator,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: textError != "" ? Colors.red : Colors.grey.shade200),
              borderRadius: BorderRadius.circular(9),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(9),
            ),
            hintText: HintText,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        textError != "" && textError != null
            ? Row(
                children: [
                  SizedBox(height: 20, width: size.width * 0.1),
                  const Icon(Icons.warning, color: Colors.red, size: 18),
                  const SizedBox(width: 5),
                  Text(
                    "$textError",
                    style: GoogleFonts.inter(color: Colors.red),
                  ),
                ],
              )
            : Container(),
        const SizedBox(height: 16),
      ],
    );
  }
}
