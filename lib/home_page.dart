import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/model.dart';
import 'package:flutter_api_example/repo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
      print('Initial State');
       super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
        ? Center(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
          itemCount: _userModel!.length,
          itemBuilder: (context,index) {
            return Card(
              child: Column(
                children: [
                  Text('PostID: ${_userModel![index].postId}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Id: ${_userModel![index].id}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Name: ${_userModel![index].name}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Email: ${_userModel![index].email}'),
                  SizedBox(height: 5),
                  Text('Body: ${_userModel![index].body}'),
                ],
              ),
            );
          })
    );
  }
}
