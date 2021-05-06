import "package:flutter/material.dart";
import 'package:leandro_meufrete/pages/cadastrotruck.dart';
import 'cadastrotruck.dart';

class ConsultaFrete extends StatelessWidget {
  ConsultaFrete() : super();

  
  @override
  Widget build(BuildContext context) {
    final Dadosfrete dadosfrete = ModalRoute.of(context).settings.arguments;
    double pesototal = dadosfrete.tpeso + dadosfrete.cpeso;
    double totalKm;
    double qtdFretes = dadosfrete.qtdviagens;

    if(qtdFretes == null){
      totalKm = dadosfrete.fdistancia;
      qtdFretes = 1;
    }      
    else{
      totalKm = dadosfrete.fdistancia * qtdFretes;
    }
    double qtdeDiesel  = totalKm / dadosfrete.tconsumo;
    
    double custoDiesel = qtdeDiesel * dadosfrete.vdiesel;

    double vlrManut = dadosfrete.tvmanut;

    if(vlrManut == null){
      vlrManut = 0.0;
    }
    
    double precoFinal = (dadosfrete.vfrete * dadosfrete.cpeso) * qtdFretes;

    double custoFinal = (dadosfrete.fpedagio * qtdFretes) + (dadosfrete.vrefeicao * qtdFretes) + custoDiesel + vlrManut;
    double lucroLiquido = precoFinal - custoFinal;
    
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(30),
            child: ListView(children: [
              SizedBox(
                width: 128,
                height: 128,
                child: Center(
                  child: Image.asset('assets/imagens/truck2.png'),
                )
              ),
              SizedBox(                            
                height: 25,
              ),
                                          
              subTitulo('Detalhes dos Gastos:'),

              corpoTexto('Peso Total do Caminhão (incluindo a carga): '+ pesototal.toStringAsFixed(0) + ' toneladas'),
            
              corpoTexto('Total de Quilometros Rodados: ' + totalKm.toStringAsFixed(0) + ' Quilometros'),
              
              corpoTexto('Total de Combustivel gastos no frete: ' + qtdeDiesel.toStringAsFixed(1) + ' litros de diesel'),
              
              corpoTexto('Valor gasto com Diesel no frete: R\$ ' + custoDiesel.toStringAsFixed(2)),

              corpoTexto('Valor gasto com Pedágios para o frete: R\$ ' + dadosfrete.fpedagio.toStringAsFixed(2)),

              corpoTexto('Valor gasto com Refeições para o frete: R\$ ' + dadosfrete.vrefeicao.toStringAsFixed(2)),

              corpoTexto('Valor gasto com manutenções para o frete: R\$ ' + vlrManut.toStringAsFixed(2)),

              corpoTexto('Custo de todos os gastos do Frete: R\$ ' + custoFinal.toStringAsFixed(2)),

              corpoTexto('Valor cobrado pelo frete por tonelada: R\$ ' + dadosfrete.vfrete.toStringAsFixed(2)),

              SizedBox(
                height: 10,
              ),

              subTitulo('Total de Gastos:'),

              SizedBox(
                width: 128,
                height: 30,
                child: Text('R\$: ' + custoFinal.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              subTitulo('Ganhos:'),              

              corpoTexto('Valor Total do Frete:'),

              SizedBox(
                width: 128,
                height: 30,
                child: Text('R\$: ' + precoFinal.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              subTitulo('Balanço Final (Lucro Liquido):'),

              corpoTexto('Lucro liquido do frete:'),

              SizedBox(
                width: 128,
                height: 30,
                child: Text('R\$: ' + lucroLiquido.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),


              TextButton(
              child: Text('Menu Principal',
                style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
                ),
              ),
              onPressed: (){Navigator.pushNamed(context, '/menu');}, 
              ),

              SizedBox(
                height: 10,
              ),

              TextButton(
                child: Text(
                  'Voltar à Tela Anterior',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ])));
  }
  Widget subTitulo(rotulo) {
    return SizedBox(
                width: 128,
                height: 20,
                child: Text(
                  rotulo,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              );
  }
  Widget corpoTexto(texto){
    return SizedBox(
                width: 128,
                height: 20,
                child: Text(
                    texto,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                ),
    );
             
  }

  
}