import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:todo_nodejs/core/constants/api_constants.dart';
import 'package:todo_nodejs/model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static dynamic registerUser(User user) async {
    var requestBody = {
      "email": user.email,
      "password": user.password,
    };

    var headers = {"Content-Type": "application/json"};

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/registration'),
        body: jsonEncode(requestBody),
        headers: headers,
      );

      if (response.statusCode == 200) {
       

        log(response.body);
      }
      var jsonResponce = jsonDecode(response.body);
      return jsonResponce;
    } on HttpException catch (e) {
      throw HttpException('Something failed: $e');
    }
  }

  static dynamic loginUser(User user) async {
    var requestBody = {
      "email": user.email,
      "password": user.password,
    };

    var headers = {"Content-Type": "application/json"};

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: jsonEncode(requestBody),
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body);
      }
       var jsonResponce = jsonDecode(response.body);
      return jsonResponce;
    } on HttpException catch (e) {
      throw HttpException('Something failed: $e');
    }
  }
}

 // try {
    //   final dio = Dio();
 //   final response =
    //       await dio.post('$baseUrl/registration', data: requestBody);
    //   log(response.data);
    //   if (response.statusCode == 200) {
    //     log('user created succesffullyu');
    //   }
    // } on DioException catch (e) {
    //   log('An error occurred during registration: $e');
    //   rethrow;
    // }

  //     static loginUser(User user) async {
  //   final dio = Dio();
  //   Map<String, dynamic> requestBody = {
  //     'email': user.email,
  //     'password': user.password,
  //   };
  //   final response = await dio.post('$baseUrl/login', data: requestBody);
  //   if (response.statusCode == 200) {}
  // }