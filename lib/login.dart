import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food/homepage.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  TextEditingController _nome = TextEditingController();
  var nome;
  List<String> favoritos = [];
  List<String> carrinho = [];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 250, 250, 250),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              child: Image.asset('images/BannerHamburguer.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(210, 255, 145, 0),
                  fontFamily: GoogleFonts.lilitaOne().fontFamily),
            ),
            SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _nome,
                    decoration: InputDecoration(
                        label: Text('Nome'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                nome= _nome.text;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage(nome: nome, carrinho: carrinho, favoritos: favoritos,)));
                _nome.clear();
              },
              child: Text('Entrar'),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 100,
        color: Color.fromARGB(121, 107, 107, 107),
        child: Center(child: Text('Desenvolvido por Vítor Antônio Kuhnen')),
      ),
    );
  }
}
