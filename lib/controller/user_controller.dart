import 'package:flutter_list_builder/controller/call_api.dart';
import 'package:flutter_list_builder/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  var users = User();
  var isLoading = true.obs;

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void getUsers() async {
    try{
    isLoading(true);
    var fetchedUsers = await CallApi.fetchUser();

    if(fetchedUsers != null){
      users = fetchedUsers;
      print("3. No Error found actually");

      //you can print an email of an user like thisprint("let's print ${users.data![1].email}");
      //users.data has the fetched data from the api
    }
  }
    finally{
      isLoading(false);
    }
  }
}