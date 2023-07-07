import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food/homepage.dart';

class Favoritos extends StatefulWidget {
  final List<String> favoritos;
  Favoritos({Key? key, required this.favoritos}) : super(key: key);

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  int IndexTelaInicial = 1;
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
              // height: 200,
              child: ListView.builder(
                itemCount: 5, //pratos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(index);
                    },
                    child: Container(
                      width: 130,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 255, 255, 255),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage('images/combo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Hamburger Artesanal com Batata Frita',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$ 51,00",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: IndexTelaInicial,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
          setState(() {
            IndexTelaInicial = index;
          });
        },
        backgroundColor: Color.fromARGB(179, 34, 34, 34),
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
        ],
      ),
    );
  }
}
