
import 'package:flutter/material.dart';
import 'package:plant_disease_detection/main.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/utilities/helper.dart';



class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Plant disease detection"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),

      ),
     //backgroundColor: Colors.tealAccent,
      body:
      SingleChildScrollView(
        child: 
        Column(children:[

          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

               SafeArea(
                  child: ClipRRect(

                      child:
                      GestureDetector(
                          onTap: (){

                           Navigator.pushNamed(context, AppRoutes.secondscreen,arguments: ("hello"));



                          },
                          child: Stack(
                            children: [
                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                                decoration: BoxDecoration(
                                  //color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/plant_predict.jpg"),
                                    fit: BoxFit.cover
                                    ),
                                ),
                              ),

                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                             alignment: Alignment.center,
                               child: Text(
                              'Detect Disease',
                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0, fontFamily: 'Schyler'),
                                  )),



                            ],
                          ),
                      )




                        // const BinItem(),

                  ),
                ),

              SizedBox(
                    height: screenHeight(context) * 0.03

                ),


// box 2
                SafeArea(
                  child: ClipRRect(

                      child:
                      GestureDetector(
                          onTap: (){

                           Navigator.pushNamed(context, AppRoutes.secondscreen,arguments: ("hello"));



                          },
                          child: Stack(
                            children: [
                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                                decoration: BoxDecoration(
                                  //color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/plant_predict.jpg"),
                                    fit: BoxFit.cover
                                    ),
                                ),
                              ),

                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                             alignment: Alignment.center,
                               child: Text(
                              'Detect Disease',
                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0, fontFamily: 'Schyler'),
                                  )),



                            ],
                          ),
                      )




                        // const BinItem(),

                  ),
                ),




                SizedBox(
                    height: screenHeight(context) * 0.03

                ),





// box 3
                SafeArea(
                  child: ClipRRect(

                      child:
                      GestureDetector(
                          onTap: (){

                           Navigator.pushNamed(context, AppRoutes.secondscreen,arguments: ("hello"));



                          },
                          child: Stack(
                            children: [
                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                                decoration: BoxDecoration(
                                  //color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/plant_predict.jpg"),
                                    fit: BoxFit.cover
                                    ),
                                ),
                              ),

                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                             alignment: Alignment.center,
                               child: Text(
                              'Detect Disease',
                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0, fontFamily: 'Schyler'),
                                  )),



                            ],
                          ),
                      )




                        // const BinItem(),

                  ),
                ),




                SizedBox(
                    height: screenHeight(context) * 0.03

                ),




// box 4
                SafeArea(
                  child: ClipRRect(

                      child:
                      GestureDetector(
                          onTap: (){

                           Navigator.pushNamed(context, AppRoutes.secondscreen,arguments: ("hello"));



                          },
                          child: Stack(
                            children: [
                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                                decoration: BoxDecoration(
                                  //color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/plant_predict.jpg"),
                                    fit: BoxFit.cover
                                    ),
                                ),
                              ),

                              Container(
                                height: screenHeight(context) * 0.2,
                                width: screenWidth(context) * 0.9,
                             alignment: Alignment.center,
                               child: Text(
                              'Detect Disease',
                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0, fontFamily: 'Schyler'),
                                  )),



                            ],
                          ),
                      )




                        // const BinItem(),

                  ),
                ),



                SizedBox(
                    height: screenHeight(context) * 0.03

                ),




              ],
            ),
          ),
          




        ]),
      ),
    );
  }
}


class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        center: Alignment.topRight,
        radius: 0.5,
        colors: [
          Color(0xffFFA984),
          Color(0xffFF793F),
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}