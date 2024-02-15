import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();

  static const String KEYNAME = "name";
  var nameValue = "No Value Saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                    )
                  )  ,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(onPressed: () async {   // make this function async
                  //var name = nameController.text.toString();

                  var prefes = await SharedPreferences.getInstance();  //it takes time
                  prefes.setString(KEYNAME, nameController.text.toString());

                }, child: Text('Save'),),
                SizedBox(
                  height: 11,
                ),
                Text(nameValue)
              ],
            ),
          ),
        ),
      ));

  }

  void getValue() async{

    var prefs = await SharedPreferences.getInstance();
    var getNames = prefs.getString(KEYNAME);

    // nameValue = getNames !=null ? getNames : "No Value Saved";
    // or
    nameValue = getNames ?? "No Value Saved";
    setState(() {
      //To upDate the value
    });
  }
}
