import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/model/w%20model.dart';
import 'package:weather/screen/provider/w%20provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  wProvider? providerT;
  wProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<wProvider>(context, listen: true);
    providerF = Provider.of<wProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {},child: Icon(Icons.add,color: Colors.black,size: 25),backgroundColor: Color(0xff6151C3),),
        backgroundColor: Colors.black ,
        body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("error");
              } else if (snapshot.hasData) {
                WModel? w = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Hello User",
                                  style: GoogleFonts.playfairDisplay(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Discover the Weather",
                                  style: GoogleFonts.playfairDisplay(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Current Location",
                                      style: GoogleFonts.playfairDisplay(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Surat",
                                      style: GoogleFonts.playfairDisplay(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    // SizedBox(height: 12),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Partly Cloudy",
                                        style: GoogleFonts.playfairDisplay(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Image.asset("assets/images/Sun.png"),
                                  SizedBox(height: 5),
                                  Text(
                                    "${w!.main!.temp! - 273.toInt()}°C",
                                    style: GoogleFonts.dmSerifDisplay(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff6151C3),
                            borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(40),topRight: Radius.circular(40)),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            "Around The World",
                            style: GoogleFonts.playfairDisplay(
                                color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(12),
                            child: InkWell(
                              onTap: () {
                                providerT!.index = index;
                                Navigator.pushNamed(context, 'dashScreen',arguments: index);
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${providerT!.data[index].cun}",
                                            style: GoogleFonts.playfairDisplay(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "${providerT!.data[index].city}",
                                            style: GoogleFonts.playfairDisplay(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          // SizedBox(height: 12),
                                          Spacer(),
                                          // Text(
                                          //   "${w!.dt}",
                                          //   style: GoogleFonts.playfairDisplay(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.bold,
                                          //       color: Colors.black),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Image.asset("assets/images/Sun.png"),
                                        SizedBox(height: 5),
                                        // Text(
                                        //   "${providerT!.data[index].cel}",
                                        //   style: GoogleFonts.dmSerifDisplay(
                                        //       fontSize: 15,
                                        //       fontWeight: FontWeight.bold),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xff6151C3),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),topRight: Radius.circular(40)),
                                ),
                              ),
                            ),
                          ),
                          itemCount: providerT!.data.length,
                        ),
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(color: Color(0xff6151C3)),
              );
            },
            future: providerT!.loadapi(providerT!.data[providerT!.index].lat,providerT!.data[providerT!.index].lat  )),
      ),
    );
  }
}
