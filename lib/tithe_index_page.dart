import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


import 'data/tithe.dart';

class TitheIndexPage extends StatefulWidget {
  final List<Tithe> titheList;
  const TitheIndexPage({Key? key, required this.titheList}) : super(key: key);

  @override

  State<TitheIndexPage> createState() => _TitheIndexPageState();
}

class _TitheIndexPageState extends State<TitheIndexPage> {

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(71, 69, 90, 1),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 16,
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 25,)
              ),
            ),

            Positioned(
                top: 70,
                left:120,
                child: Text("10%", style: GoogleFonts.permanentMarker(color: Colors.white, fontSize: 90),)
            ),

            Positioned(
              top: 220,
              left: 30,
              child: Container(
                height: screenHeight*0.1,
                width: screenWidth*0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromRGBO(223, 249, 246, 1),
                          Color.fromRGBO(247, 235, 235, 1),
                        ]
                    )
                ),

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                      child: Icon(Icons.church, color: Color.fromRGBO(71, 69, 90, 1),size: 50,),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Container(
                        width: 1,
                        height: 30,
                        color: Color.fromRGBO(71, 69, 90, 1),
                      ),
                    ),

                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Container(
                            width: 220,
                            height: 80,
                            // color: Color.fromRGBO(71, 69, 90, 1),
                            child: Center(child: Text("And every tenth part of the land, of the seed planted, or of the fruit of trees, is holy to the Lord. ", style: GoogleFonts.acme(color: Color.fromRGBO(71, 69, 90, 0.8),),)),
                          ),
                        ),

                        Positioned(
                          top: 60,
                          left: 120,
                          child: Container(
                            width: 110,
                            height: 20,
                            // color: Colors.black45,
                            child: Text("Leviticus 27:30-34", style: GoogleFonts.acme(color: Color.fromRGBO(71, 69, 90, 1), fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 15,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: screenWidth*0.921,
                    height: screenHeight*0.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromRGBO(223, 249, 246, 1),
                              Color.fromRGBO(247, 235, 235, 1),

                            ]
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("History",style: GoogleFonts.uchen(  fontSize: 17, fontWeight: FontWeight.bold),),
                            ),

                            Spacer(),

                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenHeight*0.05,
                                      width: screenWidth*0.05,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(71, 69, 90, 0.5),
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top:10,
                                    left: 4.7,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: screenHeight*0.025,
                                        width: screenWidth*0.025,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(71, 69, 90, 1),
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                         Container(
                           height: screenHeight*0.42,
                           width: screenWidth*0.8,
                           // color: Colors.black,
                           child: ListView.builder(
                             reverse: true,
                               itemCount: widget.titheList.length,
                               itemBuilder: (context, index){
                             return Padding(
                               padding: const EdgeInsets.only(bottom: 8.0),
                               child: Container(
                                 height: 100,
                                 width: 100,
                                 decoration: BoxDecoration(

                                   color: Color.fromRGBO(71, 69, 90, 1),
                                   borderRadius: BorderRadius.circular(20)
                                 ),
                                 child: Stack(
                                   children: [
                                     Positioned(

                                       child: Container(
                                         width: 60,
                                         height: 50,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(13),
                                           gradient: LinearGradient(
                                               begin: Alignment.bottomCenter,
                                               end: Alignment.topCenter,
                                               colors: [
                                                 Color.fromRGBO(223, 249, 246, 1),
                                                 Color.fromRGBO(247, 235, 235, 1),

                                               ]
                                           ),
                                         ),
                                         child: Icon(Icons.price_check,size: 45,color: Color.fromRGBO(71, 69, 90, 1),),
                                       ),
                                       left: 20,
                                       top: 25,
                                     ),

                                     Positioned(
                                       bottom: 0,
                                       right: 0,
                                       child: Container(
                                         alignment: Alignment.center,
                                         width: 150,
                                         height: 30,
                                         // color: Colors.white,
                                         // color: Colors.yellow,
                                         child: Text(formattedDate(widget.titheList[index].date.toString()), style: GoogleFonts.ptSerif(color: Colors.white.withOpacity(0.5), fontSize: 18),),
                                       ),
                                     ),

                                     Positioned(
                                       top: 20,
                                       right: 60,
                                       child: Container(
                                         width: 150,
                                         height: 50,
                                         alignment: Alignment.center,
                                         // color: Colors.green,
                                         child: Text("GH₵ ${widget.titheList[index].amount}.00", style: GoogleFonts.ptSerif(color: Colors.white, fontSize: 24)),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             );
                           }),
                         )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formattedDate(String date) {
    var dateTime = DateTime.parse(date);
    var formattedDate = DateFormat.yMMMEd().format(dateTime);

    return formattedDate;
  }
}
