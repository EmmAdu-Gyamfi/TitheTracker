import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class TitheCalculatePage extends StatefulWidget {

  const TitheCalculatePage({Key? key}) : super(key: key);

  @override
  State<TitheCalculatePage> createState() => _TitheCalculatePageState();
}

class _TitheCalculatePageState extends State<TitheCalculatePage> {
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    late String? godsShare = "";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: Color.fromRGBO(71, 69, 90, 1),

      body: Stack(
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

          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0, left: 16, right: 16),
                child: Container(
                  height: screenHeight*0.7,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromRGBO(223, 249, 246, 1),
                            Color.fromRGBO(247, 235, 235, 1),
                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text(godsShare),


                      Padding(
                        padding: const EdgeInsets.only(bottom: 86.0, left: 16.0),
                        child: Row(
                          children: [
                            Text("Earnings", style: GoogleFonts.ptSerif(fontSize: 20, color: Color.fromRGBO(71, 69, 90, 1)),),

                            Padding(
                              padding: const EdgeInsets.only(top:3.0, left: 3),
                              child: Container(
                                height: 20,
                                width: 1,
                                color: Color.fromRGBO(71, 69, 90, 1),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(" GH₵", style: GoogleFonts.ptSerif(fontSize: 14, color: Color.fromRGBO(71, 69, 90, 0.8) ),),
                            ),

                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 1.0, left: 8),
                                  child: Container(
                                    width: screenWidth*0.5,
                                    child: TextField(
                                      controller: textEditingController,
                                     onChanged: (value){
                                        setState(() {
                                          godsShare = value;
                                        });
                                     },
                                      textAlign: TextAlign.center,
                                      cursorColor: Color.fromRGBO(71, 69, 90, 1),
                                      style: GoogleFonts.satisfy(fontSize: 24),
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color.fromRGBO(71, 69, 90, 1))
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color.fromRGBO(71, 69, 90, 1))
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color.fromRGBO(71, 69, 90, 1))
                                        ),

                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),


                              ],
                            )
                          ],
                        ),
                      ),

                      InkWell(

                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: 70,
                            width: 313,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(71, 69, 90, 1),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            // style: ButtonStyle(
                            //   fixedSize: MaterialStateProperty.all(Size(343,70)),
                            // ),
                            //
                            // onPressed: () { },
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 116.0, right: 8),
                                child: Icon(Icons.save, color: Colors.white),
                              ),
                              Text('Save', style: GoogleFonts.ptSerif(fontSize: 24, color: Colors.white),)]),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),



            ],
          ),


        ],
      ),
    );
  }
}
