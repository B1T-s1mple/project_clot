import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:scot/features/auth/presentation/cubit/auth_state.dart';
import 'package:scot/features/auth/presentation/model/auth_model.dart';
import 'package:scot/features/auth/presentation/page/forgot_page.dart';
import 'package:scot/features/auth/presentation/page/xz_page.dart';
import 'package:scot/features/auth/presentation/widgets/primary_button.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerFirstName.dispose();
    controllerLastName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 51),
              TextFeldPrimary(
                hintTextl: 'Firstname',
                controlerprimary: controllerFirstName,
              ),
              const SizedBox(height: 15),
              TextFeldPrimary(
                hintTextl: 'Lastname',
                controlerprimary: controllerLastName,
              ),
              const SizedBox(height: 15),
              TextFeldPrimary(
                hintTextl: 'Email Address',
                controlerprimary: controllerEmail,
              ),
              const SizedBox(height: 15),
              TextFeldPrimary(
                hintTextl: 'Password',
                controlerprimary: controllerPassword,
              ),
              const SizedBox(height: 40),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is Signup) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => XzPage(userId: state.userId),
                      ),
                    );
                  }
                  if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return PrimaryButton(
                    ontap: () {
                      if (controllerFirstName.text.isNotEmpty &&
                          controllerLastName.text.isNotEmpty &&
                          controllerEmail.text.isNotEmpty &&
                          controllerPassword.text.isNotEmpty) {
                        final request = RegisterRequest(
                          firstName: controllerFirstName.text.trim(),
                          lastName: controllerLastName.text.trim(),
                          email: controllerEmail.text.trim(),
                          password: controllerPassword.text.trim(),
                        );

                        context.read<AuthCubit>().registerUser(request);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Iltimos, barcha maydonlarni to'ldiring!",
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Text('Forgot Password ? '),
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPage(),
                        ),
                      );
                    },
                    child: const Text(
                      ' Reset',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
