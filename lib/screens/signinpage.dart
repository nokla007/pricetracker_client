import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/authentication.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 40.0,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            //Elevated Button
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              onPressed: () async {
                await context
                    .read<Authentication>()
                    .signIn(_emailController.text, _passwordController.text);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    context.read<Authentication>().toggleHaveAccount();
                  },
                  child: const Text(
                    'Sign Up!',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              child: Text(
                'Continue without sign in',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
              onPressed: () {
                context.read<Authentication>().anonymousSignIn();
                // print(context.read<Authentication>().currentUser);
              },
            )
          ],
        ),
      ),
    );
  }
}
