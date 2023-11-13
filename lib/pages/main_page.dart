import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/model/day_time_weather.dart';
import 'package:weatherapp/model/model_class.dart';
import 'package:weatherapp/service/day_time_net_service.dart';
import 'package:weatherapp/service/net_service.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({super.key, required this.city});
  String city;

  @override
  State<MainPage> createState() => _MainPageState(city);
}

class _MainPageState extends State<MainPage> {
  String _city;

  _MainPageState(this._city);

  TextEditingController textEditingController = TextEditingController();

  // http://api.weatherapi.com/v1/current.json?key=2e091dec0ba44650acc112837231211&q=Tashkent&aqi=yes
  NetService netService = NetService();

  // http://api.weatherapi.com/v1/forecast.json?key=2e091dec0ba44650acc112837231211&q=Tashkent&days=1&aqi=yes&alerts=no
  DayTimeNetService dayTimeNetService = DayTimeNetService();
  //  NetService dan kelgan currentWeatherData turli malumotni o'zini turiga mos classdan olingan  obyectga tenglaymiz
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  DayTimeWeather dayTimeWeather = DayTimeWeather();
  late List<Forecastday> _list = [];
  List<String> cities = [
    "Samarqand",
    "Toshkent",
    "Buxoro",
    "Navoiy",
    "Andijon",
    "Namangan",
    "Fergana",
    "Jizzakh",
    "Qashqadaryo",
    "Khorezm",
    "Karakalpakistan",
    "Surkhandarya",
    "Moscow",


  ];
  List<DayTimeWeather> citiesLast = [];

  @override
  void initState() {
    malumotOlishUchun();
    dayTimeMalumotOlish();
    citiesFunction();
    super.initState();
  }

  void malumotOlishUchun() async {
    netService.getCurrWeath(_city ?? 'Tashkent').then((value) {
      //   bu yerda value NetService ni return qiymatini oladi
      currentWeatherData = value;
    });
  }

  void dayTimeMalumotOlish() async {
    dayTimeNetService.soatWeather(_city ?? "Tashkent").then((value) {
      dayTimeWeather = value;
      _list = dayTimeWeather.forecast!.forecastday!;
      // _list.forEach((element) {
      //   print(element.hour?[12].time?.substring(11, 16));
      //   print(element.hour?[12].time?.substring(0, 10));
      // });
      for(int i = 0; i < cities.length; i++) {
            dayTimeNetService.soatWeather(cities[i]).then((value) {
              citiesLast.add(value);
            });
          }
    });
  }

  void citiesFunction() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/orqa.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x901518F5),
                        Color(0x8E8716FF)])),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // tepadan birinchi
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/img_1.png",
                        width: 40,
                      ),
                      Text(
                        "${currentWeatherData.location?.region}",
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {

                          });
                        },
                        child: Image.asset(
                          "assets/img_2.png",
                          width: 40,
                        ),
                      )
                    ],
                  ), // tepadan birinchi
                ), // tepadan birinchi
                Container(
                  // ikkinchi
                  height: 300,
                  child: Column(
                    children: [
                      Text("${currentWeatherData.current?.condition?.text}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                      Image.network(
                        "http:${currentWeatherData.current?.condition?.icon}",
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${currentWeatherData.current?.tempC?.toInt()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold)),
                          Column(
                            children: [
                              SizedBox(height: 20,),
                              Image.asset(
                                "assets/img_4.png",
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        "${currentWeatherData.location?.localtime}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ), // ikkinchi
                Container(
                  // uchinchi
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: 250,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x905D5ED9), Color(0x8E9444EA)])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/img_5.png",
                            width: 40,
                          ),
                          Text("${currentWeatherData.current?.cloud}%",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13)),
                          const Text("Precipitation",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/img_6.png",
                            width: 40,
                          ),
                          Text("${currentWeatherData.current?.humidity}%",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13)),
                          const Text("humidity",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/img_7.png",
                            width: 40,
                          ),
                          Text("${currentWeatherData.current?.windKph} km/h",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13)),
                          const Text("Wind speed",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ), // uchinchi
                Container(
                  // turtinchi
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today",
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                      Text("7 Days",
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ), // turtinchi
                Container(
                    // beshinchi
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 120,
                    child: ListView.separated(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return buildItem(index);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 10,
                          color: Colors.green,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    )), // beshinchi
                Container(
                  // oltinchi
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Other Cities",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                ), // oltinchi
                Container(
                  height: 65,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return getLast(index);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 12,
                          color: Colors.green,
                        );
                      },
                      itemCount: 9
                  ),
                ) // oxirgi qator
              ],
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: const Color(0x79640FBE),
          buttonBackgroundColor: const Color(0xFF3E57D5),
          color: Color(0xFFB010EF),
          items: const <Widget>[
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.find_in_page_sharp, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
            Icon(Icons.add_alert_rounded, color: Colors.white),
          ],
          onTap: (int index) {
            setState(() {
              // 1 tartib raqamli icon bosilganda joy kiritilish kk Dialog orqali
              index == 1
                  ? showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Enter city name:"),
                            actions: [
                              TextField(
                                controller: textEditingController,
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return MainPage(
                                            city: textEditingController.text,
                                          );
                                        },
                                      ));
                                    });
                                  },
                                  child: const Text("Continiu"))
                            ],
                          ))
                  : null;
            });
          },
        ));
  }

  Widget buildItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        width: 90,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x90090AEC),
                  Color(0x8E9444EA)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_list[index].hour?[12].time?.substring(11, 16)}",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              "${_list[index].hour?[12].time?.substring(0, 10)}",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Image.network(
              "http:${_list[index].hour?[12].condition?.icon}",
              width: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${_list[index].hour?[12].tempC}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Image.asset(
                  "assets/img_4.png",
                  width: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getLast(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MainPage(city: "${citiesLast[index].location!.region}");
          },));
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
          width: 150,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x902A2CD9),
                    Color(0x8E9444EA)])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "http:${citiesLast[index].forecast?.forecastday?[0].hour?[12].condition?.icon}",
                width: 30,
              ),
              Column(
                children: [
                  const SizedBox(height: 5,),
                  Text("${citiesLast[index].location?.region}",
                      style: const TextStyle(color: Colors.white, fontSize: 13)),
                  const SizedBox(height: 10,),
                  Text("${citiesLast[index].forecast?.forecastday?[0].day?.condition?.text}",
                      style: const TextStyle(color: Colors.white, fontSize: 13)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${citiesLast[index].current?.tempC?.toInt()}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Image.asset(
                    "assets/img_4.png",
                    width: 5,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
