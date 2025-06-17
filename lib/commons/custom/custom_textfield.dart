import 'package:flutter/material.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class CustomTextfield extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool readOnly;

  const CustomTextfield({
    super.key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.prefixIcon,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscureText;
  bool _hasError = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateField(String? value) {
    if (widget.validator != null) {
      final error = widget.validator!(value);
      setState(() {
        _hasError = error != null;
        _errorText = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly,
          onChanged: (value) {
            _validateField(value);
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          onTap: widget.onTap,
          style: AppTextTheme.regularText.copyWith(
            color: widget.enabled ? Colors.black87 : Colors.grey,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: fillBorderRadius,
              borderSide: BorderSide(
                color: _hasError ? Colors.red : Colors.transparent,
                width: _hasError ? 1.5 : 0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: fillBorderRadius,
              borderSide: BorderSide(
                color: _hasError ? Colors.red : Colors.transparent,
                width: _hasError ? 1.5 : 0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: fillBorderRadius,
              borderSide: BorderSide(
                color: _hasError ? Colors.red : buttonColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: fillBorderRadius,
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: fillBorderRadius,
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            filled: true,
            fillColor:
                widget.enabled
                    ? (_hasError ? Colors.red.withOpacity(0.05) : fillHintColor)
                    : Colors.grey.withOpacity(0.1),
            hintText: widget.hint,
            hintStyle: AppTextTheme.regularText.copyWith(
              color: widget.enabled ? Colors.grey : Colors.grey.shade400,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      onPressed: _togglePasswordVisibility,
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: _hasError ? Colors.red : secondaryColor,
                      ),
                    )
                    : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            counterText: "", // Hide character counter
            errorStyle: const TextStyle(height: 0), // Hide default error text
          ),
        ),
        // Custom error text display
        if (_hasError && _errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 12),
            child: Row(
              children: [
                const Icon(Icons.error_outline, size: 16, color: Colors.red),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    _errorText!,
                    style: AppTextTheme.tiny.copyWith(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
