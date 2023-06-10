import 'package:flutter/material.dart';

class Batman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batman: O Cavaleiro das Trevas'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              // Ação para navegar para outra página
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OutraPagina()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Text('Gênero: Super-Herói. \n Batman: O Cavaleiro das Trevas se passa em Gotham City, onde o Batman, interpretado por Christian Bale, continua sua luta contra o crime. Desta vez, ele enfrenta um dos seus maiores desafios: o Coringa, interpretado por Heath Ledger.'),
        ),
      ),
    );
  }
}

class OutraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outra Página'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Text('Gênero: Ação. \n 007 - Operação Skyfall é o 23º filme da franquia de James Bond, lançado em 2012. O filme é dirigido por Sam Mendes e estrelado por Daniel Craig como James Bond. Após uma missão mal-sucedida em Istanbul, James Bond é dado como morto e desaparece do radar. Enquanto o MI6 é atacado e ameaçado de exposição, M, a chefe do serviço secreto britânico, se vê diante de um passado sombrio que volta para assombrá-la. Com o MI6 sendo atacado, 007 retorna para proteger M e confrontar a ameaça.'),
        ),
      ),
    );
  }
}