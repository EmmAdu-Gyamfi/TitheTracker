import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/tithe_calculator_page.dart';
import 'package:untitled/tithe_index_page.dart';

import 'data/tithe.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String titheAmount = "";

  List<Tithe> titheList = [];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){openDialog();},
        label:  Text("Give to God"), icon: Icon(Icons.wallet_rounded), backgroundColor: Color.fromRGBO(71, 69, 90, 1),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children:[
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Container(
                    height: screenHeight*0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),),
                      child:  CachedNetworkImage(
                        imageUrl: "https://images.unsplash.com/photo-1423483641154-5411ec9c0ddf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JhcGV8ZW58MHx8MHx8&w=1000&q=80",
                        placeholder: (context, url) => Center(child: CupertinoActivityIndicator(radius: 15,)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    )

                ),
              ),

              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  height: screenHeight*0.6,
                  width: double.infinity,
                  // color: Colors.black.withOpacity(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )
                  ),

                ),
              ),



              Positioned(

                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                child: Container(
                  height: screenHeight*0.6,
                  width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),

                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Divider(color: Colors.white,indent: 150, thickness: 2, endIndent: 4,)
                            ),

                            Text("the", style: GoogleFonts.modernAntiqua(color: Colors.white, fontSize:25, fontWeight: FontWeight.w900)),

                            Expanded(
                                child: Divider(color: Colors.white, endIndent: 150, thickness: 2, indent: 4,)
                            ),
                          ],
                        ),

                        Text("ONE TENTH", style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize:45, fontWeight: FontWeight.w800)),

                        Text("INITIATIVE", style: GoogleFonts.roboto(color: Colors.white, fontSize:30, fontWeight: FontWeight.w400)),




                      ],

                    ),
                  ),
                ),
                ),
              ),

              Positioned(
                  right: 10,
                  top: 20,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TitheIndexPage(titheList: titheList,)));
                    },
                    child: Container(
                      width: screenWidth*0.12,
                      height: screenHeight*0.12,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromRGBO(223, 249, 246, 1),
                                Color.fromRGBO(247, 235, 235, 1),
                              ]
                          ),
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: Icon(Icons.list_rounded, size: 35, color: Color.fromRGBO(71, 69, 90, 1),),
                    ),
                  )
              ),
      ]
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Honor the LORD with your wealth, with the first fruits of all your crops; then your barns will be filled to overflowing, and your vats will brim over with new wine.", style: GoogleFonts.modernAntiqua(color: Colors.black.withOpacity(0.6), fontSize:16)),
          ),

          Row(
            children: [
              Expanded(
                  child: Divider(color: Colors.black.withOpacity(0.1), indent: 10, thickness: 1, endIndent: 5, )
              ),

              Text("Proverbs 3:9-10", style: GoogleFonts.poppins(color: Color.fromRGBO(71, 69, 90, 1), fontSize:15, fontWeight: FontWeight.w900)),

              Expanded(
                  child: Divider(color: Colors.black.withOpacity(0.1), endIndent: 10, thickness: 1, indent: 5,)
              ),
            ],
          ),

          Stack(
            children: [


                Padding(

                  padding: const EdgeInsets.only(top:8.0, right: 200),
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    height: screenHeight*0.2,
                      width: screenWidth*0.3,
                      child: Image.asset("assets/images/cross1.jpg")
                  ),
                ),

            ],
          )
        ],
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
      actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          },
              child: Text("Cancel",  style: GoogleFonts.acme(color: Color.fromRGBO(71, 69, 90, 1), fontSize: 18),)),


        TextButton(onPressed: (){
            addTithe(titheAmount);
        },
            child: Text("Save", style: GoogleFonts.acme(color: Color.fromRGBO(71, 69, 90, 1), fontSize: 18),))

      ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text("God's share", style: GoogleFonts.acme(fontSize: 20, color: Color.fromRGBO(71, 69, 90, 1)),) ,
      content: TextField(
        onChanged: (value){
          setState(() {
            titheAmount = value;
          });
        },
        enabled: true,
        cursorColor: Color.fromRGBO(71, 69, 90, 1),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: GoogleFonts.poppins(fontSize: 14, color: Color.fromRGBO(71, 69, 90, 1),),
          labelText: "Amount",
          enabled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(71, 69, 90, 1))
          ) ,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(71, 69, 90, 1))
          ),
          prefix: Text(" GH₵ ", style: GoogleFonts.ptSerif(fontSize: 14, color: Color.fromRGBO(71, 69, 90, 0.8) ),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color.fromRGBO(71, 69, 90, 1))
          )
        ),
      ),
      ));

  void addTithe(String tithe) {
    Tithe newTithe = new Tithe();
    newTithe.amount = tithe;
    newTithe.date = DateTime.now();

    setState(() {
      titheList.add(newTithe);
    });

    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => TitheIndexPage(titheList: titheList,)));



  }
}
