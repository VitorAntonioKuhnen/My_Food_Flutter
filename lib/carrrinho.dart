import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_food/favoritos.dart';
import 'package:my_food/homepage.dart';

class Carrinho extends StatelessWidget {
  // final String categoryName;
  final List<String> favoritos;
  final List<String> carrinho;
  String nome;
  Carrinho(
      {Key? key,
      required this.nome,
      required this.carrinho,
      required this.favoritos})
      : super(key: key);

  int IndexTelaInicial = 2;
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
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/food_image.jpg'),
            ),
            title: Text('Item ${index + 1}'),
            subtitle: Text('R\$ ${(index + 1) * 5}.00'),
            trailing: QuantityButton(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: IndexTelaInicial,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage(favoritos: favoritos, carrinho: carrinho, nome: '',)));
          }
          else if (index == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Favoritos(
                          favoritos: favoritos,
                          carrinho: [],
                          nome: '',
                        )));
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
  
  void setState(Null Function() param0) {}
}

class QuantityButton extends StatefulWidget {
  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (quantity > 0) {
              setState(() {
                quantity--;
              });
            }
          },
        ),
        Text(quantity.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
      ],
    );
  }
}
