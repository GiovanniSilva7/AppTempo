import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../app/stores/auth_store.dart';

class LoginPage extends StatelessWidget {
  final AuthStore _authStore = Modular.get<AuthStore>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
child: Column(
children: [
TextField(
controller: emailController,
decoration: InputDecoration(labelText: 'Email'),
),
TextField(
controller: passwordController,
decoration: InputDecoration(labelText: 'Password'),
obscureText: true,
),
SizedBox(height: 20),
Observer(
builder: (_) => ElevatedButton(
onPressed: () {
_authStore.login(emailController.text, passwordController.text);
},
child: Text('Login'),
),
),
TextButton(
onPressed: () {
Modular.to.pushNamed('/register');
},
child: Text('Register'),
),
],
),
),
);
}
}
       
