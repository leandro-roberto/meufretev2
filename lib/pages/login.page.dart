import 'package:flutter/material.dart';
import 'package:leandro_meufrete/pages/cadastro.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class LoginTMP {
  final String usuariotmp;
  final String senhatmp;
  LoginTMP(this.usuariotmp, this.senhatmp);
}

class _LoginPageState extends State<LoginPage> {
  var tempUser;
  var tempPassword;
  String cell;
  
  @override
  Widget build(BuildContext context) {
    final Login login = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          //top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.grey[100],
        child: ListView(children: <Widget>[
          SizedBox(
            width: 168,
            height: 64,
            child: Center(
              child: Text(
                'Meu Frete',
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
            height: 168,
            //child: Icon(Icons.delivery_dining, size: 120, color: Colors.blueAccent),
            child: Center(
              child: Image.asset('assets/imagens/truck4.png'),
            )
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
                width: 128,
                height: 20,
                child: Center(
                  child: Text('Digite seu usuário e senha ou faça seu cadastro', 
                    style: TextStyle(
                    color: Colors.blueAccent,
                    //fontFamily: 'Satisfy',
                    //fontWeight: FontWeight.w500,
                    fontSize: 12,
                    ),
                  ),
                ),
            ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Usuário",
              labelStyle: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )
            ),
            onChanged: (value) {
              tempUser = value.toString();
            },
          ),
          
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )
            ),
            onChanged: (value) {
            tempPassword = value.toString();
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only
            (top: 10,
            left: 40,
            right: 40, 
                       
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 4),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
              // ignore: deprecated_member_use
            child: FlatButton(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (tempUser == null || tempPassword == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Usuario e senha vazios! Favor digitar os dados!'),
                      duration: Duration(seconds: 2),
                      )
                    );
                  } 
                  else {
                    var logintmp = LoginTMP(tempUser, tempPassword);
                    // ignore: unrelated_type_equality_checks
                    if (login.usuario == logintmp.usuariotmp && login.senha == logintmp.senhatmp) {
                      //var dados = Dados(login.nome, login.telefone);
                      Navigator.pushNamed(context, '/menu');
                    } 
                    else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Usuario ou Senha incorretos.'),
                          duration: Duration(seconds: 2),
                            )
                          );
                    }                      
                  }
                });
              }
              
            )
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            child: TextButton(
              child: Text(
                "Clique aqui para cadastrar seu Usuário e Senha",
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');                              
              }
            )
          )
        ]
      ),
    )
  );
    
  }
}
