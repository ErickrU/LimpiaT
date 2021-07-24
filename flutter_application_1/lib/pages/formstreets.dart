import 'package:flutter/material.dart';  
  
void formstreets() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    final appTitle = 'Formulario Colonia/calles';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
        appBar: AppBar(  
          backgroundColor: Colors.green,
          
          title: Text(appTitle),  
        ),  
        body: MyCustomForm(),  
      ),  
    );  
  }  
}  
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
} 
 
// Create a corresponding State class. This class holds data related to the form.  
class MyCustomFormState extends State<MyCustomForm> {  
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey<FormState>();  
  
  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
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