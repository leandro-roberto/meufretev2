import 'package:flutter/material.dart';

class CadastroTruck extends StatefulWidget {
  @override
  _CadastroTruckState createState() => _CadastroTruckState();
}

var consumo = TextEditingController();
var vlrDiesel = TextEditingController();
var pesoCaminhao = TextEditingController();
var distanciaKM = TextEditingController();
var freteTonelada = TextEditingController();
var pescoCarga = TextEditingController();
var vlrPedagio = TextEditingController();
var vlrManut = TextEditingController();
var qtdeViagens = TextEditingController();
var vlrRefeicao = TextEditingController();


class Dadosfrete {
  final double tconsumo;
  final double vdiesel;
  final double tpeso;
  final double fdistancia;
  final double cpeso;
  final double fpedagio;
  final double tvmanut;
  final double vfrete;
  final double vrefeicao;
  final double qtdviagens;

  Dadosfrete(this.cpeso, this.fdistancia, this.fpedagio,this.qtdviagens, this.tconsumo, this.tpeso, this.tvmanut, this.vdiesel, this.vfrete, this.vrefeicao);
  
}

class _CadastroTruckState extends State<CadastroTruck> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(
            //top: 60,
            left: 40,
            right: 40,
          ),
          child: ListView(children: [
            SizedBox(
              height: 20,
                      ),
            SizedBox(
                width: 128,
                height: 128,
                child: Center(
                  child: Image.asset('assets/imagens/truck3.png'),
                )
              ),
            Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Cadastro dos valores e dados do frete',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      subTitulo('Dados do Caminhão', 40, 220),
                      SizedBox(
                        height: 10,
                      ),
                      //Row com os campos Peso e Carroceria
                      Row(children: [
                        formNumval('Peso Caminhão (Ton)', pesoCaminhao),
                      SizedBox(
                          width: 10,
                      ),
                      Expanded(child: 
                        formNumval('Custo Manutenção R\$', vlrManut),
                      )
                      ]),

                      SizedBox(
                        height: 10,
                      ),

                      //Row com os campos Consumo e Valor do Diesel
                      Row(children: [
                        formNumval('Consumo Caminhão Km/l', consumo),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(child: 
                          formNumval('Valor Diesel R\$', vlrDiesel),       
                        )
                      ]),

                      SizedBox(
                        height: 10,
                      ),

                      subTitulo('Dados do Frete', 40, 220),

                      SizedBox(
                        height: 10,
                      ),

                      //Row com Distancia e valor do Frete por tonelada
                      Row(children: [
                        formNumval('Distancia Total em KM', distanciaKM),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: 
                          formNumval('Valor Frete / Ton R\$', freteTonelada),
                        )
                      ]),
                    
                      SizedBox(
                        height: 10,
                      ),
                      //Row com o peso da carga e Pedágio (se existir)
                      Row(children: [
                        formNumval('Peso da Carga (ton)',pescoCarga),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(child: 
                          formNumval('Valor Pedagio em R\$', vlrPedagio),
                        )
                      ]),

                      SizedBox(
                        height: 10,
                      ),
                      //Row com o peso da carga e Pedágio (se existir)
                      Row(children: [
                        formNumval('Quantidade de Viagens',qtdeViagens),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(child: 
                          formNumval('Valor Refeição', vlrRefeicao),
                        )
                      ]),
                     
                      SizedBox(
                        height: 40,
                      ),

                      botaoSalvar('Salvar os dados'),

                      SizedBox(
                        height: 20,
                      ),

                      TextButton(
                        child: Text(
                          'Menu Principal',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]))
          ])),
    );
  }



//Subtitulos
  Widget subTitulo(rotulo, altura, largura) {
    return Text(
      rotulo,
      style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

//Forms de Numero com validação
  Widget formNumval(rotulo, variavel) {
    return Container(
        width: 150,
        child: TextFormField(
            controller: variavel,
            autocorrect: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: rotulo),
            validator: (value) {
              value = value.replaceFirst(',', '.');
              if (double.tryParse(value) == null) {
                return 'Entre com um valor numérico';
              } else {
                return null;
              }
            }));
  }

  Widget botaoSalvar(rotulo) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        child: Text(rotulo, style: TextStyle(fontSize: 18)),
        onPressed: () {
          if (formKey.currentState.validate()) {
            setState(() {
              if (vlrPedagio == null){
                vlrPedagio = 0.0 as TextEditingController;
              }

              if (vlrManut == null){
                vlrManut = 0.0 as TextEditingController;
              }

              if (qtdeViagens == null){
                qtdeViagens = 1 as TextEditingController;
              }

              if (vlrRefeicao == null){
                vlrRefeicao = 0.0 as TextEditingController;
              }

              if(consumo == null || vlrDiesel == null || pesoCaminhao == null || distanciaKM == null || 
              freteTonelada == null || pescoCarga == null){
                caixaDialogo('Campos Obrigatórios não preenchidos', 'Favor preencher todos os campos obrigatórios para continuar');

              }
              else{

              double pcaminhao =
                  double.parse(pesoCaminhao.text.replaceFirst(',', '.'));
              double ccaminhao =
                  double.parse(consumo.text.replaceFirst(',', '.'));
              double valordiesel =
                  double.parse(vlrDiesel.text.replaceFirst(',', '.'));
              double dfrete =
                  double.parse(distanciaKM.text.replaceFirst(',', '.'));
              double valorfrete =
                  double.parse(freteTonelada.text.replaceFirst(',', '.'));
              double pcarga =
                  double.parse(pescoCarga.text.replaceFirst(',', '.'));
              double valorpedagio =
                  double.parse(vlrPedagio.text.replaceFirst(',', '.'));
              double valormanut = 
                  double.parse(vlrManut.text.replaceFirst(',', '.'));
              double valorrefeicao = 
                  double.parse(vlrRefeicao.text.replaceFirst(',', '.'));
              double qtdedeviagens = 
                  double.parse(qtdeViagens.text.replaceFirst(',', '.'));

              var dadosfrete = Dadosfrete(pcarga, dfrete, valorpedagio,qtdedeviagens, ccaminhao, pcaminhao, valormanut, valordiesel, valorfrete,valorrefeicao);
              
              Navigator.pushNamed(context, '/consfrete', arguments: dadosfrete);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Dados enviados com sucesso!'),
                        duration: Duration(seconds: 2),
                      ));
              }
            });
          }
        },
        /* onLongPress: (){
          print('botão direito pressionado!');
        },*/
      ),
    );
  }

  caixaDialogo(rotulo, msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(rotulo),
            content: Text(msg),
            actions: [
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
