import 'package:flutter/material.dart';
import '/EmailVerificationScreen.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          labelStyle: TextStyle(color: Colors.purple),
        ),
        iconTheme: const IconThemeData(color: Colors.purple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
        ),
      ),
      home: Scaffold(
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
              child: RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nome',
              icon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 20.0),
          const TextField(
            decoration:  InputDecoration(
              labelText: 'Que tipo de música quer ouvir?',
              icon: Icon(Icons.queue_music),
            ),
          ),
          const SizedBox(height: 20.0),
          const TextField(
            decoration:  InputDecoration(
              labelText: 'E-mail',
              icon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20.0),
          const TextField(
            decoration: const InputDecoration(
              labelText: 'Senha',
              icon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20.0),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirmar Senha',
              icon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: ()  {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailVerificationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                'Registrar',
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
                  'Já possui uma conta? ',
                  style: TextStyle(),
                ),
                GestureDetector(
                  onTap: () {
                    print('Clique para fazer login');
                  },
                  child: const Text(
                    'Faça login aqui',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
