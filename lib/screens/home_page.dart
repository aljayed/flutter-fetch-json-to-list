// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_list_builder/controller/user_controller.dart';
import 'package:flutter_list_builder/models/user.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  User userList = User();

  Datum dataList = Datum();

  Support support = Support();

  final UserController userController = Get.put(UserController());
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() => userController.isLoading == true ? Center(child: CircularProgressIndicator()) : ListView.builder(
              itemBuilder: (context, index){
                return Container(
                  color: index.isEven ? Colors.white : Colors.orange[50],
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(userController.users.data![index].avatar.toString()),
                          radius: 60,
                        ),
                        title: Text(
                         "${userController.users.data![index].email}"
                         ),
                        subtitle: Text("${userController.users.data![index].firstName} ${userController.users.data![index].lastName}"),

                        trailing: SizedBox(
                          child: Text(
                            "${userController.users.support!.text}"
                          ),
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                
                );
              },
            itemCount: userController.users.data!.length == null ? 3 : userController.users.data!.length,
            //itemCount: 3,
          ), )
    );
  }
}

