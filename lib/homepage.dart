import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final List<String> favoritos;
  final List<String> carrinho;
  String nome;
  HomePage(
      {Key? key,
      required this.nome,
      required this.carrinho,
      required this.favoritos})
      : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Food',
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(210, 255, 145, 0),
              fontFamily: GoogleFonts.lilitaOne().fontFamily),
        ),
        actions: [
          Container(
            width: 50,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              child: Image.asset('images/user.png', width: 300),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Container(
              height: 100,
              color: Color.fromARGB(48, 82, 82, 81),
              alignment: Alignment.center,
              child: Image.asset(
                'images/Banner_Anuncio.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
