import 'dart:math';
import 'package:flutter/material.dart';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);
  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  var imagemApp = AssetImage('imagens/padrao.png');
  var resultadoFinal = "Boa Sorte";

  void opcaoSelecionada(String escolhausuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print('Escolha do App: ' + escolhaApp);
    print('Escolha do usuario: ' + escolhausuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }
    if ((escolhausuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhausuario == "tesoura" && escolhaApp == "papel") ||
        (escolhausuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        resultadoFinal = "Parabens você Ganhou !!!";
      });
    } else if ((escolhaApp == "pedra" && escolhausuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhausuario == "papel") ||
        (escolhaApp == "papel" && escolhausuario == "pedra")) {
      setState(() {
        resultadoFinal = "Perdeu para maquina";
      });
    } else {
      setState(() {
        resultadoFinal = "Empate !!! tente novamente";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: const Image(
                  image: AssetImage('imagens/pedra.png'),
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: const Image(
                  image: AssetImage('imagens/papel.png'),
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("tesoura"),
                child: const Image(
                  image: AssetImage('imagens/tesoura.png'),
                  height: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 37, bottom: 16),
            child: Text(
              resultadoFinal,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
