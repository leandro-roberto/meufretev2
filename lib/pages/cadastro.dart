import 'package:flutter/material.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class Login {
  final String usuario;
  final String senha;
  final String nome;
   
  Login(this.usuario, this.senha, this.nome);
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var txtUser, txtPassword, txtNome, txtTelefone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(
          //top: 60,
          left: 40,
          right: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cadastro de Usuários',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            //Icone do usuario
            SizedBox(
              width: 128,
              height: 128,
              child: Icon(Icons.supervised_user_circle,
                  size: 120, color: Colors.blueAccent),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nome:'),
              onChanged: (value) {
                txtNome = value.toString();
              },
            ),
            SizedBox(
              height: 10,
            ),
            
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Usuario:'),
              onChanged: (value) {
                txtUser = value.toString();
              },
            ),
            SizedBox(
              height: 10,
            ),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Senha:'),
              onChanged: (value) {
                txtPassword = value.toString();
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                child: Text(
                  'Clique aqui para enviar',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (txtNome == null) {
                      txtNome = 'Usuario';
                    }
                    if (txtUser == null ||
                        txtPassword == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Favor preencher usuário e senha antes de enviar'),
                        duration: Duration(seconds: 2),
                      ));
                    } else {                      
                      var login =
                          Login(txtUser, txtPassword, txtNome);

                      Navigator.pushNamed(context, '/login', arguments: login);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Dados enviados com sucesso!'),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  });
                }),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text(
                'Voltar à tela de login',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
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
