import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food/carrrinho.dart';
import 'package:my_food/favoritos.dart';
import 'package:my_food/listaProdutos.dart';

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
  List<String> favoritos = [];
  List<String> carrinho = [];
  int IndexTelaInicial = 0;
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
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                ),
              ),
            ),
            Container(
              height: 90,
              color: Color.fromARGB(48, 82, 82, 81),
              alignment: Alignment.center,
              child: Image.asset(
                'images/Banner_Anuncio.png',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                'Categorias',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(210, 0, 0, 0),
                    fontFamily: GoogleFonts.lilitaOne().fontFamily),
              ),
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ListaProdutos(favoritos: favoritos, carrinho: carrinho, nome: '',)));
      
                      print('Hamburguer');
                    },
                    child: Container(
                      width: 100,
                      child: Image.asset(
                        'images/Burger.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ListaProdutos(favoritos: favoritos, carrinho: carrinho, nome: '',)));
      
                      print('Café');
                    },
                    child: Container(
                      width: 100,
                      child: Image.asset(
                        'images/Coffee.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ListaProdutos(favoritos: favoritos, carrinho: carrinho, nome: '',)));
      
                      print('Pizza');
                    },
                    child: Container(
                      width: 100,
                      child: Image.asset(
                        'images/Pizza.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                'Mais Populares',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(210, 0, 0, 0),
                    fontFamily: GoogleFonts.lilitaOne().fontFamily),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, //pratos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(index);
                    },
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage('images/hamburger.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Hamburger Artesanal',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$ 51,00",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                'Recomendados',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(210, 0, 0, 0),
                    fontFamily: GoogleFonts.lilitaOne().fontFamily),
              ),
            ),
            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, //pratos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(index);
                    },
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            color: Color.fromARGB(255, 255, 255, 255),
                            child: Container(
                              height: 100,
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
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$ 51,00",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: IndexTelaInicial,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Favoritos(favoritos: favoritos, carrinho: carrinho, nome: '',)));
          }
          else if (index == 2){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Carrinho(favoritos: favoritos, carrinho: carrinho, nome: '',)));
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
