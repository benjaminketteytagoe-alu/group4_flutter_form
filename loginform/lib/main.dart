import 'package:flutter/material.dart';
import 'form_model.dart';
import 'form_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF2F4F7),
      ),
      home: const DynamicFormScreen(),
    );
  }
}

class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({Key? key}) : super(key: key);

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final FormModel _model = FormModel();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Submitted successfully'),
          backgroundColor: Color(0xFF2E7D32),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _usernameController.clear();
    _passwordController.clear();
    setState(() {
      _model.reset();
      _isPasswordObscured = true;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 420),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Banner Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.shade200,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Group 4 Welcomes You Back!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  // Form Controls
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormRowLayout(
                            label: 'Username',
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: customInputDecoration('Enter username'),
                              onSaved: (val) => _model.username = val ?? '',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username cannot be empty';
                                }
                                if (value.length < 10) {
                                  return 'Username must be at least 10 char long';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),

                          FormRowLayout(
                            label: 'Password',
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: _isPasswordObscured,
                              decoration: customInputDecoration(
                                'Enter password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey.shade600,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordObscured = !_isPasswordObscured;
                                    });
                                  },
                                ),
                              ),
                              onSaved: (val) => _model.password = val ?? '',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 char long';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),

                          FormRowLayout(
                            label: 'Sex',
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'Male',
                                  groupValue: _model.sex,
                                  activeColor: Colors.black87,
                                  onChanged: (val) => setState(() => _model.sex = val!),
                                ),
                                const Text('Male'),
                                const SizedBox(width: 12),
                                Radio<String>(
                                  value: 'Female',
                                  groupValue: _model.sex,
                                  activeColor: Colors.black87,
                                  onChanged: (val) => setState(() => _model.sex = val!),
                                ),
                                const Text('Female'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),

                          FormRowLayout(
                            label: 'Courses',
                            child: Column(
                              children: _model.courses.keys.map((String course) {
                                return CheckboxListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(course, style: const TextStyle(fontSize: 14)),
                                  value: _model.courses[course],
                                  activeColor: Colors.indigo,
                                  controlAffinity: ListTileControlAffinity.leading,
                                  onChanged: (bool? checked) {
                                    setState(() {
                                      _model.courses[course] = checked ?? false;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tuition',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '\$${_model.tuition.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.green.shade300,
                              inactiveTrackColor: Colors.grey.shade300,
                              thumbColor: Colors.grey.shade800,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            ),
                            child: Slider(
                              value: _model.tuition,
                              min: 0,
                              max: 10000,
                              onChanged: (val) {
                                setState(() {
                                  _model.tuition = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 28),

                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE2F0D9),
                                    foregroundColor: Colors.black87,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.green.shade300),
                                    ),
                                  ),
                                  child: const Text('Submit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _clearForm,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE53935),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text('Clear', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}