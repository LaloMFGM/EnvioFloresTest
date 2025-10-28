import 'package:envioflorestest/presentation/providers/github_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final Function(String)? onSubmitted;
  final Function(String)? updateUsername;
  final VoidCallback? onTaped; 
  

  const CustomTextFormField({super.key, required this.hintText, required this.onSubmitted, this.updateUsername, this.onTaped});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.updateUsername,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: widget.onTaped,
          child: const Icon(Icons.search),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        filled: true,
        fillColor: Colors.white,
      ),

      onFieldSubmitted: widget.onSubmitted,
    );
  }
}
