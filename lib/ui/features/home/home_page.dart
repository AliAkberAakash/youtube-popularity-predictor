import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_popularity_predictor/core/pages/empty_page.dart';
import 'package:youtube_popularity_predictor/core/pages/loading_pge.dart';
import 'package:youtube_popularity_predictor/data/models/message_response.dart';
import 'package:youtube_popularity_predictor/data/repositories/repository.dart';
import 'package:youtube_popularity_predictor/di/dependency_injection.dart';
import 'package:youtube_popularity_predictor/utils/my_colors.dart';
import 'package:youtube_popularity_predictor/utils/string_formatter.dart';

import 'home_bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home"
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primary, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:primary ,width: 2.0),
                  ),
                  hintText: 'Enter youtube video link or id',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                elevation: 5.0,
                minWidth: 300.0,
                height: 35,
                color: primary,
                child: new Text('Find',
                    style: new TextStyle(fontSize: 16.0, color: white)),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
