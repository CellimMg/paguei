//authentication form screen
import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({Key? key}) : super(key: key);

  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isLogin = true;
  bool _isLoading = false;

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      print(email);
      print(password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                  ),
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    child: Text(_isLogin ? 'Login' : 'Sign up'),
                    onPressed: _submitForm,
                  ),
                TextButton(
                  child: Text(
                    _isLogin
                        ? 'Create new account'
                        : 'I already have an account',
                  ),
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
