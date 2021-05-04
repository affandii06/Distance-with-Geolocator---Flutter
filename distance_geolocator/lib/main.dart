import 'package:distance_geolocator/provider/distanceprovider.dart';
import 'package:distance_geolocator/service/distance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController cLatnow = TextEditingController();
  TextEditingController cLongnow = TextEditingController();
  TextEditingController cLatdesti = TextEditingController();
  TextEditingController cLongdesti = TextEditingController();

  double dLatnow;
  double dLongnow;
  double dLatdesti;
  double dLongdesti;

  final _keydistance = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DistanceProvider>(
      create: (context)=> DistanceProvider(),
      child: Consumer<DistanceProvider>(
        builder:(context, result, _)=> Scaffold(
          appBar: AppBar(
            title: Text('Distance with geolocator'),
          ),
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: _keydistance,
              child: ListView(
                children: [
                  Text('Current Location'),
                  TextFormField(
                    controller: cLatnow,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Insert Lat Now';
                      }
                      return null;
                    },
                    onSaved: (value)=>dLatnow = double.parse(cLatnow.text),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: cLongnow,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Insert Long Now';
                      }
                      return null;
                    },
                    onSaved: (value)=>dLongnow = double.parse(cLongnow.text),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 20,),

                  Text('Destination Location'),
                  TextFormField(
                    controller: cLatdesti,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Insert Lat Destination';
                      }
                      return null;
                    },
                    onSaved: (value)=>dLatdesti = double.parse(cLatdesti.text),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: cLongdesti,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Insert Long Destination';
                      }
                      return null;
                    },
                    onSaved: (value)=>dLongdesti = double.parse(cLongdesti.text),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 20,),
                  RaisedButton(
                    child: Text('Hitung'),
                    color: Colors.green,
                    onPressed: (){
                      final form = _keydistance.currentState;
                      if(form.validate()){
                        form.save();
                        result.getdistance(dLatnow, dLongnow, dLatdesti, dLongdesti);
                      }
                    }
                  ),

                  SizedBox(height: 20,),
                  Text('Result :'),
                  SizedBox(height: 10,),
                  Text(result.result.toString() + ' Km', style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
