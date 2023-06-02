import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/w model.dart';
import '../provider/w provider.dart';

class dashScreen extends StatefulWidget {
  const dashScreen({Key? key}) : super(key: key);

  @override
  State<dashScreen> createState() => _dashScreenState();
}

class _dashScreenState extends State<dashScreen> {
  wProvider? providerT;
  wProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<wProvider>(context, listen: true);
    providerF = Provider.of<wProvider>(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Error");
            } else if (snapshot.hasData) {
              WModel? w = snapshot.data;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                " ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                style: GoogleFonts.play(
                                    fontSize: 18, color: Colors.grey)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("📍${providerT!.data[index].city},",
                                    style: GoogleFonts.play(
                                        fontSize: 22, color: Colors.white)),
                                Column(
                                  children: [
                                    SizedBox(height: 5),
                                    Text(" ${providerT!.data[index].cun}",
                                        style: GoogleFonts.play(
                                            fontSize: 18, color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          Text(
                              " ${DateTime.now().hour}:${DateTime.now().minute}",
                              style: GoogleFonts.play(
                                  fontSize: 18, color: Colors.grey)),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Image.asset("assets/images/dashbg.jpg"),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 70,
                          left: 70,
                        ),
                        child: Container(
                            width: 250,
                            height: 250,
                            child: Image.asset(
                              "assets/images/Sun.png",
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text("${w!.weather![0].main}",
                      style:
                          GoogleFonts.play(fontSize: 22, color: Colors.white)),
                  SizedBox(height: 10),
                  Text("${w!.main!.temp! - 273.toInt()}°C",
                      style:
                          GoogleFonts.play(fontSize: 35, color: Colors.white)),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Max Temprature\n          ${w.main!.tempMax!-273}°C",
                              style:
                              GoogleFonts.play(fontSize: 15, color: Colors.white)),
                          Text("Min Temprature\n          ${w.main!.tempMin!-273}°C",
                              style:
                              GoogleFonts.play(fontSize: 15, color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(height: 1,color: Colors.white),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("humidity\n    ${w.main!.humidity}",
                              style:
                              GoogleFonts.play(fontSize: 15, color: Colors.white)),
                          Text("Air Flow\n   ${w.wind!.speed}",
                              style:
                              GoogleFonts.play(fontSize: 15, color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(height: 1,color: Colors.white,),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("FeelsLike\n     ${w.main!.feelsLike}",
                              style:
                              GoogleFonts.play(fontSize: 15, color: Colors.white)),
                          Text("Pressure\n   ${w.main!.pressure}",
                              style:
                              GoogleFonts.play(fontSize: 15, color: Colors.white)),
                        ],
                      ),

                    ],
                  ),
                ],
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xff6151C3),
            ));
          },
          future: providerF!
              .loadapi(providerT!.data[index].lat, providerT!.data[index].log),
        ),
      ),
    );
  }
}
