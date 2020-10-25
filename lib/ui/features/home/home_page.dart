import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_popularity_predictor/core/pages/empty_page.dart';
import 'package:youtube_popularity_predictor/core/pages/loading_pge.dart';
import 'package:youtube_popularity_predictor/data/models/message_response.dart';
import 'package:youtube_popularity_predictor/data/repositories/repository.dart';
import 'package:youtube_popularity_predictor/di/dependency_injection.dart';
import 'package:youtube_popularity_predictor/utils/string_formatter.dart';

import 'home_bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MessageResponse _response;

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
      body: BlocProvider(
        create: (context) => HomeBloc(repository: locator<Repository>())
        ..add(GetMessageEvent()), //load data at the start
        child: Builder(
          builder: (ctxB){
            print("Event was loaded");
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (ctx, state){
                if(state is HomeLoadingState){
                  return LoadingPage();
                }else if(state is HomeLoadedState) {
                  if(state.response!=null){
                    _response = state.response; //in case we need the response
                    if(state.response.success){
                      return Center(
                        child: Text(
                          checkNull(_response?.message),
                        ),
                      );
                    }
                  }
                }
                return EmptyPage(message: "Failed to load data from the server",);
              },
            );
          },
        ),
      ),
    );
  }
}
