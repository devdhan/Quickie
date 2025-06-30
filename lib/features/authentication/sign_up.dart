import 'package:flutter/material.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/custom_textfield.dart';
import 'package:quickq/commons/enums/user_type.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/features/authentication/create_pin.dart';
import 'package:quickq/features/authentication/sign_in.dart';

class SignUp extends StatefulWidget {
  final UserType userType;

  const SignUp({super.key, this.userType = UserType.student});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  /// Navigate to Create Pin page
  void _navigateToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CreatePin()),
    );
  }

  /// Navigate to Sign In page
  void _navigateToSignIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  /// Handle sign up process
  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Check password confirmation
    if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorDialog('Passwords do not match');
      return;
    }

    setState(() => _isLoading = true);

    try {
      //Implement  sign up logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // Navigate to success page or main app
      if (mounted) {
        _showSuccessDialog();
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog('Sign up failed. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  /// Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  /// Show success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(
              '${widget.userType == UserType.student ? 'Student' : 'Staff'} account created successfully!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _navigateToDashboard(context);
                },
                child: const Text('Continue to Create Pin'),
              ),
            ],
          ),
    );
  }

  /// Manual validation for all fields
  bool _validateAllFields() {
    // Validate full name
    if (_fullNameController.text.trim().isEmpty) {
      _showErrorDialog('Full name is required');
      return false;
    }
    if (_fullNameController.text.trim().length < 3) {
      _showErrorDialog('Full name must be at least 3 characters');
      return false;
    }

    // Validate ID
    final idError = _validateId(_idController.text);
    if (idError != null) {
      _showErrorDialog(idError);
      return false;
    }

    // Validate email
    final emailError = _validateEmail(_emailController.text);
    if (emailError != null) {
      _showErrorDialog(emailError);
      return false;
    }

    // Validate password
    final passwordError = _validatePassword(_passwordController.text);
    if (passwordError != null) {
      _showErrorDialog(passwordError);
      return false;
    }

    return true;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validate password strength
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, and number';
    }
    return null;
  }

  /// Validate ID field based on user type
  String? _validateId(String? value) {
    if (value == null || value.isEmpty) {
      return '${widget.userType == UserType.student ? 'Matric Number' : 'Staff ID'} is required';
    }

    if (widget.userType == UserType.student) {
      // Example matric number validation (adjust based on your institution's format)
      if (!RegExp(r'^BU\d{2}[A-Z]{3}\d{4}$').hasMatch(value.toUpperCase())) {
        return 'Please enter a valid matric number (e.g., BU21CSC1001)';
      }
    } else {
      // Staff ID validation
      if (value.length < 3) {
        return 'Staff ID must be at least 3 characters';
      }
    }
    return null;
  }

  /// Get ID field hint based on user type
  String get _idHint =>
      widget.userType == UserType.student
          ? 'Matric Number (e.g., BU21CSC1001)'
          : 'Staff ID';

  /// Get page title based on user type
  String get _pageTitle =>
      'SIGN UP AS ${widget.userType == UserType.student ? 'STUDENT' : 'STAFF'}';

  @override
  void dispose() {
    _fullNameController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: _pageTitle, showLeading: true),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: paddingRoundOne,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User type indicator
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: buttonColor.withOpacity(0.3)),
                ),
                child: Text(
                  widget.userType == UserType.student
                      ? '👨‍🎓 Student Registration'
                      : '👨‍💼 Staff Registration',
                  style: AppTextTheme.tiny.copyWith(color: buttonColor),
                ),
              ),
              spacebtwn,

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextfield(
                        controller: _fullNameController,
                        hint: 'Full Name',
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Full name is required';
                          }
                          if (value.trim().length < 2) {
                            return 'Full name must be at least 2 characters';
                          }
                          return null;
                        },
                      ),
                      spacebtwn,

                      CustomTextfield(
                        controller: _idController,
                        hint: _idHint,
                        keyboardType: TextInputType.text,
                        validator: _validateId,
                      ),
                      spacebtwn,

                      CustomTextfield(
                        controller: _emailController,
                        hint: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                      ),
                      spacebtwn,

                      CustomTextfield(
                        controller: _passwordController,
                        hint: 'Password',
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        validator: _validatePassword,
                      ),
                      spacebtwn,

                      CustomTextfield(
                        controller: _confirmPasswordController,
                        hint: 'Confirm Password',
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                      ),
                      spacebtwn,

                      // Password requirements
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password Requirements:',
                              style: AppTextTheme.tiny.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '• At least 8 characters\n• Include uppercase & lowercase letters\n• Include at least one number',
                              style: AppTextTheme.tinytwo,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Sign in prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: AppTextTheme.tinytwo),
                  spaceRowbtwn,
                  GestureDetector(
                    onTap: () => _navigateToSignIn(context),
                    child: Text(
                      "Sign In",
                      style: AppTextTheme.tiny.copyWith(
                        color: buttonColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              spacebtwn,

              // Sign up button
              CustomRedButton(
                text: _isLoading ? 'Creating Account...' : 'Sign Up',
                onPressed: _isLoading ? () {} : () => _handleSignUp(),
              ),
              spacebtwn,
            ],
          ),
        ),
      ),
    );
  }
}
