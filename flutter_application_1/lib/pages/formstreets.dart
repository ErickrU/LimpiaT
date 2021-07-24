import 'package:flutter/material.dart';  

class formPage extends StatefulWidget {
  formPage({Key? key}) : super(key: key);

  @override
  _formPageState createState() => _formPageState();
}

class _formPageState extends State<formPage> {
  final _formKey = GlobalKey<FormState>();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rutas", textAlign: TextAlign.center),
      ),
      body: _bodyform(),
    );
  }
  Widget _bodyform(){

  return Form(  
      key: _formKey,  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[
          SizedBox(
              width: 50,
              height: 10,
            ), 
          TextFormField(  
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
              fillColor: Colors.white,        
              icon: const Icon(
                Icons.map_outlined,
                color: Colors.green,
                ),
                  
              hintText: 'Coloque el nombre de la colonia',  
              labelText: 'Colonia',
              labelStyle: TextStyle(
                color: Colors.green
              )                    
            ),  
          ),
          SizedBox(
              width: 50,
              height: 25,
            ),  
          TextFormField(  
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
              fillColor: Colors.white,    
              icon: const Icon(
                Icons.maps_home_work_sharp,
                color: Colors.green,
                ),  
              hintText: 'Coloque el nombre de las calles por las que pasara',  
              labelText: 'Calles',
              labelStyle: TextStyle(
                color: Colors.green
              )  
            ),  
          ),
          SizedBox(
              width: 50,
              height: 25,
            ),  
          TextFormField(  
            decoration:  InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
              fillColor: Colors.white,    
            icon: const Icon(
              Icons.calendar_today,
              color: Colors.green,
              ),  
            hintText: 'Descripcion, nota o comentario',  
            labelText: 'Nota',
            labelStyle: TextStyle(
                color: Colors.green
              )  
            ),  
           ),
           SizedBox(
              width: 50,
              height: 25,
            ),
           TextFormField(  
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
              fillColor: Colors.white,    
              icon: const Icon(
                Icons.directions_bus,
                color: Colors.green,
                ),  
              hintText: 'Numero de camion',  
              labelText: 'Camion',
              labelStyle: TextStyle(
                color: Colors.green
              )  
              ),  
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(140, 55, 10, 5),
            child: FloatingActionButton.extended(
                backgroundColor: Colors.green,
                onPressed: (){
                  //Navigator.popAndPushNamed(context, 'menu');
                }, 
                label: Text("Guardar"),
                icon: Icon(
                  Icons.save,
                  color: Colors.white
                  ),
              ),
          )       
        ],  
      ),  
    );
  }
}