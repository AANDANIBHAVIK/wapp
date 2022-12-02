import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wapp/model/weatherDataModel.dart';
import 'package:wapp/provider/homeprovider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          title: Text(
            "Weather App",
            style: TextStyle(color: Colors.black),
          ),
          // centerTitle: true,
          backgroundColor: Colors.blue.shade600,
          elevation: 0,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Surat"),
                    onTap: () {
                      Provider.of<Home_Provider>(context, listen: false)
                          .change("21.1702", "72.8311");
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Jamnagar"),
                    onTap: () {
                      Provider.of<Home_Provider>(context, listen: false)
                          .change("22.4707", "70.0577");
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Banglore"),
                    onTap: () {
                      Provider.of<Home_Provider>(context, listen: false)
                          .change(" 20.7912", "50.3148");
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Pune"),
                    onTap: () {
                      Provider.of<Home_Provider>(context, listen: false)
                          .change("0.2136", "22.5180");
                    },
                  ),

                  PopupMenuItem(
                    child: Text("Junagadh"),
                    onTap: () {
                      Provider.of<Home_Provider>(context, listen: false)
                          .change("55.6956", "23.1984");
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Bhavnagar"),
                    onTap: () {
                      Provider.of<Home_Provider>(context, listen: false)
                          .change("21.7745", "72.1525");
                    },
                  ),
                ];
              },
            ),
          ],
        ),
        body: FutureBuilder<WeatherDataModel>(
          future: Provider.of<Home_Provider>(context, listen: false).weatherapi(
              Provider.of<Home_Provider>(context, listen: true).lat,
              Provider.of<Home_Provider>(context, listen: true).lon),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              snapshot.error;
            } else if (snapshot.hasData) {
              WeatherDataModel data = snapshot.data!;
              return Column(
                children: [
                  Container(
                    height: 250,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${data.clouds!.all}°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold)),
                          Text("${data.weather![0].main}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.device_thermostat),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Tempreture",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Text("${data.clouds!.all}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.air),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Wind Speed",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Text("${data.wind!.speed} km/h",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.wb_twilight),
                        SizedBox(
                          width: 10,
                        ),
                        Text("SunSet",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Text("${data.sys!.sunset} km/h",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.air),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Wind Degree",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Text("${data.wind!.deg}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.settings_accessibility),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Huminity",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Text("${data.main!.humidity}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.satellite_alt),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Visibility",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Text("${data.visibility} km/h",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.sunny_snowing),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Sunrise",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Text("${data.sys!.sunrise}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
