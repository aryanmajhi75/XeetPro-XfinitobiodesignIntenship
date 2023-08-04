import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Authentication {
  
  //url for the aws login access
  final authPostUrl = Uri.https(
      'eg9qgexj91.execute-api.ap-south-1.amazonaws.com',
      '/practice/relive_app');

  //function to sign in the app
  Future<void> signin(context, userName, password) async {
    final response = await post(
      authPostUrl,
      body: jsonEncode(<String, dynamic>{
        'username': userName,
        'password': password,
        'service': 'signin',
      }),
      headers: {},
    );

    // sample of failed response
    // errorMessage: An error occurred (NotAuthorizedException) when calling
    // the InitiateAuth operation: Incorrect username or password.,
    // errorType: NotAuthorizedException,
    // requestId: 8293947a-8875-48f8-a13c-d2370ab4a092,

    if (jsonDecode(response.body)["errorMessage"] != null) {
      if (jsonDecode(response.body)["errorType"] == "NotAuthorizedException") {
        //error is username already exists
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Incorrect username or password"),
        ));
      }
    }

    // sample of successfull response
    // {
    // ChallengeParameters: {},
    // AuthenticationResult: {
    // AccessToken: eyJraWQiOiJ0TmY2d2R5MzVzTUhGZmVOMFwvMmV1c3cxOFVDNFJsZkRNMz
    // RUeVdOcmNKQT0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIyZTM2M2I0Ni02Mzg2LTRjNmIt

    else {
      //successfull login
      if (kDebugMode) {
        print(
            "tokens : ${json.decode(response.body)["AuthenticationResult"]["RefreshToken"]}");
      }

      if (json.decode(response.body)["AuthenticationResult"] != null) {
        var accessToken =
            json.decode(response.body)["AuthenticationResult"]["AccessToken"];
        var refreshToken =
            json.decode(response.body)["AuthenticationResult"]["RefreshToken"];

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signing you in')),
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // onSuccessfulLogin(accessToken, refreshToken, context);
      }
    }
  }
}
