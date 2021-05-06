import 'package:flutter/material.dart';

class MenuPrincipal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
          ),
        child: ListView(
          children: [
            SizedBox(
                width: 168,
                height: 50,
                child: Center(
                  child: Text('Meu Frete', 
                    style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'Satisfy',
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                    ),
                  ),
                ),
            ),
            SizedBox(
                width: 128,
                height: 128,
                child: Center(
                  child: Image.asset('assets/imagens/truck4.png'),
                )
              ),
            
            SizedBox(
              width: 300,
              height: 40,
              child: Center(
                child: Text('Olá! Bem vindo ao aplicativo Meu Frete!',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 128,
              height: 40,
              child: Center(
                child: Text('Escolha uma opção:',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Cadastros do Frete', style: TextStyle(fontSize: 20)),
              subtitle: Text('Cadastro dos detalhes do frete, do caminhão e dos valores fixos',
                style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pushNamed(context, '/cadtruck');
              },
              hoverColor: Colors.blueAccent[100],
            ),
            SizedBox(height: 10),
            
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Resultados do Frete', style: TextStyle(fontSize: 20)),
              subtitle: Text(
                  'Mostra os valores calculados do frete baseado nos valores cadastrados.',
                  style: TextStyle(fontSize: 16)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Precisa cadastrar os itens no menu Cadastros do Frete'),
                        duration: Duration(seconds: 2),
                      ));
              },
              hoverColor: Colors.blueAccent[100],
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text('Sobre o Aplicativo', style: TextStyle(fontSize: 20)),
              subtitle: Text(
                  'Informações sobre o aplicativo, suas funcionalidades e os detalhes do desenvolvedor.',
                  style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pushNamed(context, '/sobre');
              },
              hoverColor: Colors.blueAccent[100],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text('Voltar à tela de login',
                style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                ),
              ),
              onPressed: (){Navigator.pushNamed(context, '/login');}, 
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  
}