import 'package:flutter/material.dart';

class about extends StatefulWidget {
  about({Key? key}) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de nosotros')
      ),
      body: _objects()
    );
  }
  _objects(){
    return ListView(
      padding:EdgeInsets.all(10),
      children: [
        Text('Planteamiento del problema:\n',
        style: const TextStyle(fontWeight: FontWeight.bold),),
        Text('"El deficiente sistema actual de limpias en Tulancingo, es la causa por la cual encontramos en muchas colonias basura en las esquinas a cualquier hora, propón una solución tecnológica que permita al municipio de Tulancingo ofrecer un mejor servicio"\n'),
        Text('Objetivos del proyecto:\n',
        style: const TextStyle(fontWeight: FontWeight.bold),),
        Text('Reducir la contaminación en la región de Tulancingo de Bravo (limpias).\n'),
        Text('Mantener las calles más limpias que en las condiciones actuales.\n'),
        Text('Mejorar la organización en el área de sistema de limpias del municipio de Tulancingo de Bravo.\n'),
        Text('Tener a la población en comunicación para la recolección de su basura.\n'),
        Text('Permitirle a la población saber con más precisión la ruta que recorrerá el camión de la basura en las colonias y sectores de la comunidad.\n'),
      ],
    );
  }
}