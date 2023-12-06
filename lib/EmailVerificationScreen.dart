import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.email,
              size: 100.0,
              color: Colors.purple,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Verifique seu e-mail',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Enviamos um link de verificação para o seu e-mail. Por favor, verifique sua caixa de entrada e siga as instruções.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                print('Verificando e-mail...');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text('Verificar E-mail'),
            ),
          ],
        ),
      ),
    );
  }
}
