import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  void _login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == 'joao@gmail.com' && password == '123') {
      // Autenticação bem-sucedida
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      print('Login bem-sucedido!');
    } else {
      // Autenticação falhou
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciais inválidas. Tente novamente.'),
          backgroundColor: Colors.red,
        ),
      );
      print('Login falhou!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FASI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'ON',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: LoginForm(
              emailController: emailController,
              passwordController: passwordController,
              onLoginClick: () {
                _login(context);
              },
              onRegisterClick: () {
                _navigateToRegister(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() onLoginClick;
  final Function() onRegisterClick;

  LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.onLoginClick,
    required this.onRegisterClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'E-mail',
              icon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              icon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Text('Lembre de mim'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print('Esqueceu a senha pressionado');
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onLoginClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Se não tem uma conta, ',
                  style: TextStyle(),
                ),
                GestureDetector(
                  onTap: onRegisterClick,
                  child: const Text(
                    'clique aqui',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
