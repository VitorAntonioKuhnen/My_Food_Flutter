import 'package:flutter/material.dart';
import 'package:my_food/carrrinho.dart';
import 'package:my_food/favoritos.dart';

class ListaProdutos extends StatefulWidget {
  // const ListaProdutos({Key? key}) : super(key: key);
  final List<String> favoritos;
  final List<String> carrinho;
  String nome;
  ListaProdutos(
      {Key? key,
      required this.nome,
      required this.carrinho,
      required this.favoritos})
      : super(key: key);

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  int _selectedIndex = 0;
  Map<String, Map<String, dynamic>> favoritos = {};
  Map<String, Map<String, dynamic>> carrinho = {};

  List<Widget> _buildItems() {
    List<Widget> items = [];
    for (int i = 0; i < 10; i++) {
      String nomeComida = 'Comida $i';
      String imagemComida = 'images/combo.png';
      Map<String, dynamic> detalhesComida = {
        'localFoto': imagemComida,
        'nomeComida': nomeComida,
        'valor': 10.99,
        'descricao': 'Descrição da comida $i',
      };
      items.add(
        ListTile(
          leading: Image.asset(imagemComida),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nomeComida),
              Text(
                'R\$ ${detalhesComida['valor'].toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (favoritos.containsKey(nomeComida)) {
                      favoritos.remove(nomeComida);
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Removido dos Favoritos!!'),
                            duration: Duration(seconds: 2),
                          )
                          );
                    } else {
                      favoritos[nomeComida] = detalhesComida;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Adicionado aos Favoritos!!'),
                            duration: Duration(seconds: 2),
                          )
                          );
                    }
                  });
                },
                icon: Icon(
                  favoritos.containsKey(nomeComida)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    carrinho[nomeComida] = detalhesComida;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Adicionado ao Carrinho!'),
                            duration: Duration(seconds: 2),
                    ));
                  });
                },
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return items;
  }

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
          ),
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
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: _buildItems(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
           if (index == 1) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Favoritos(favoritos: [], carrinho: [], nome: '',)));
          }
          else if (index == 2){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Carrinho(favoritos: [], carrinho: [], nome: '',)));
          }
          setState(() {
            _selectedIndex = index;
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