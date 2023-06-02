import 'package:flutter/material.dart';
import 'package:weather/screen/model/dataModel.dart';
import 'package:weather/screen/model/w%20model.dart';
import 'package:weather/screen/utills/api_helper.dart';

class wProvider extends ChangeNotifier
{
  WModel w = WModel();
  var image = 'assets/images/Sun.png';
  List <dataModel>data= [
    dataModel(cun: "India",city: "Surat",lat: "21.1702",log: "72.8311",),
    dataModel(cun: "India",city: "Mumbai",lat: "19.0760",log: "72.8777",),
    dataModel(cun: "United Kingdom",city: "London",lat: "51.5072",log: "0.1276",),
    dataModel(cun: "India",city: "Delhi",lat: "28.7041",log: "77.1025",),
    dataModel(cun: "United Arab Emirates",city: "Dubai",lat: "25.2048",log: "55.2708",),
    dataModel(cun: "India",city: "Ahmedabad",lat: "23.0225",log: "72.5714",),
    dataModel(cun: "India",city: "Bangalore",lat: "12.9716",log: "77.5946",),
    dataModel(cun: "India",city: "Chennai",lat: "13.0827",log: "80.2707",),
    // dataModel(cun: "",city: "",lat: "",log: "",),
    // dataModel(cun: "",city: "",lat: "",log: "",),
    // dataModel(cun: "",city: "",lat: "",log: "",),
    // dataModel(cun: "",city: "",lat: "",log: "",),

  ];
  int index=0;
  Future<WModel> loadapi(String? plat,String? plog)
  async {

    return await apiHelper.apihelper.api_helper(plat! , plog!);
  }

  void imagechange(var tp)
  {
    if(w.weather![0].main==tp)
    {
      image = 'assets/images/Sun.png';
    }
    else if(w.weather![0].main==tp)
    {
      image = 'assets/images/Suncloud.png';
    }
    else if(w.weather![0].main==tp)
    {
      image = 'assets/images/rain.png';
    }
    notifyListeners();
  }
}