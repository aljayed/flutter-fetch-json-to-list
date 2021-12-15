import 'package:flutter_list_builder/models/user.dart';
import 'package:http/http.dart' as http;

class CallApi{
  static var client = http.Client();

  static Future fetchUser() async {
    var response = await client.get(Uri.parse("https://reqres.in/api/users"));

    print(response.body);
    print("1. Here is the error \n ${userFromJson(response.body)}");

    if(response.statusCode == 200){
      return userFromJson(response.body);
    }
    else{
      return null;
    } 
  }
}