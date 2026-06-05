import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/Yengi%20_mavzula/cubit/login_cubit.dart';
import 'package:scot/features/Yengi%20_mavzula/cubit/login_state.dart';
import 'package:toastification/toastification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextField(controller: emailController),
            TextField(controller: passwordController),
            SizedBox(
              height: 50,
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is FirebaseError) {
                    toastification.show(title: Text(state.message));
                  } else if (state is FirebaseSuccess) {
                    toastification.show(
                      title: Text(state.user.email ?? 'No email'),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<LoginCubit>().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                    child: const Text('Signup'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
