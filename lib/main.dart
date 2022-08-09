
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detection/routes/routes.dart';
//import 'package:plant_disease_detection/utilities/helper.dart';


import 'package:tflite/tflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: AppRoutes.appRoutes,
     // home: MyHomePage(title: 'Image Upload'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? selectedImage;
  String? message = '';

// uploadImage()
// async {
//     final request = http.MultipartRequest(
//         "POST", Uri.parse("http://c742-2400-adcc-106-4600-1d10-ff11-c6e7-edd5.ngrok.io/upload")
//     );

//     final headers = {"Content-type" : "multipart/form-data"};

//     request.files.add(http.MultipartFile('image',
//     selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
//     filename: selectedImage!.path.split("/").last));

//     request.headers.addAll(headers);
//     final response = await request.send();
//     http.Response res = await http.Response.fromStream(response);
//     final resJason = json.decode(res.body);
//     message = resJason['message'];
//     setState(() {});
// }




  loadMyModel() async {
    var resultant = await Tflite.loadModel(
        labels: "assets/labels.txt",
        model: "assets/final_model.tflite"
    );

    print("result after loading model: $resultant");
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  late List _result;
  String _confidence = "";
  String _name = "";
  String numbers = "";

  predict(File file) async{
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 38,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5
    );

    setState(() {
      _result = res!;


      String str = _result[0]["label"];

      _name = str.substring(2);
      // ignore: unnecessary_null_comparison
      _confidence = _result != null ? (_result[0]["confidence"] * 100.0).toString().substring(0,2) + "%" : "";

    });

  }






  Future getImage() async
  {
    final PickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(PickedImage!.path);
    setState(() {
      predict(selectedImage!);
    });
  }


  @override
  Widget build(BuildContext context) {

    final  Object? rcvdData = ModalRoute.of(context)!.settings.arguments;
    final text = rcvdData.toString();
    print(" ${text}");



    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage == null ? Text('Please pick a image')
                : Image.file(selectedImage!),


            Text("Name: $_name \n Confidence: $_confidence"),

                  Text("$rcvdData"),




            const Center(


              child: IconButton(
                icon:  Icon
                  (Icons.accessibility_outlined,
                  color: Colors.white,
                  size: 25,

                ),
                tooltip: 'Location',
                onPressed: (null),
              ),

            ),




          ],
        ),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: getImage

      ,
        child: const Icon(Icons.add_a_photo),
      ),


    );
  }
}
