import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:scot/features/auth/presentation/cubit/auth_state.dart';
import 'package:scot/features/auth/presentation/model/auth_model.dart';
import 'package:scot/features/auth/presentation/page/create_page.dart';
import 'package:scot/features/auth/presentation/widgets/primary_button.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';
import 'package:scot/features/home/presentation/widgets/bar.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final controleremail = TextEditingController();
  final controlerpassword = TextEditingController();

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
                    'Sign in',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 51),
              TextFeldPrimary(
                hintTextl: 'Email',
                controlerprimary: controleremail,
              ),
              const SizedBox(height: 15),
              TextFeldPrimary(
                hintTextl: 'Password',
                controlerprimary: controlerpassword,
              ),

              const SizedBox(height: 27),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  Bar()),
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
                      if (controleremail.text.isNotEmpty &&
                          controlerpassword.text.isNotEmpty) {
                        final request = LoginRequest(
                          email: controleremail.text.trim(),
                          password: controlerpassword.text.trim(),
                        );

                        context.read<AuthCubit>().loginUser(request);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("tori kiritse kirit bomasa 👹👹👹"),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 17),
              Row(
                children: [
                  const Text('Dont have an Account ?'),
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreatePage()),
                      );
                    },
                    child: const Text(
                      ' Create One',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 71),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,

                    backgroundColor: AppColor.secondaryColors,
                  ),

                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.apple, color: Colors.black, size: 36),
                      SizedBox(width: 60),
                      Text(
                        'Continue With Apple',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,

                    backgroundColor: AppColor.secondaryColors,
                  ),

                  onPressed: () {},
                  child: Row(
                    children: [
                      const SizedBox(width: 7),
                      Image.asset(AppImages.googleicon, width: 24, height: 24),
                      const SizedBox(width: 60),
                      const Text(
                        'Continue With Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,

                    backgroundColor: AppColor.secondaryColors,
                  ),

                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.facebook, color: Colors.blue, size: 36),
                      SizedBox(width: 60),
                      Text(
                        'Continue With Facebook',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
