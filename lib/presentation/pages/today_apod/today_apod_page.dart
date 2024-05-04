import 'package:flutter/material.dart';
import 'package:flutter_nasa_app/container_injection.dart';
import 'package:flutter_nasa_app/presentation/bloc/today_apod_bloc.dart';

class TodayApodPage extends StatefulWidget {
  const TodayApodPage({super.key});

  @override
  State<TodayApodPage> createState() => _TodayApodPageState();
}

class _TodayApodPageState extends State<TodayApodPage> {
  late TodayApodBloc _bloc;

  @override
  void initState() {
    
    _bloc = getIt<TodayApodBloc>();
    _bloc.input.add(FetchApodTodayEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TodayApodState>(
      stream: _bloc.stream, 
      builder: (context, snapshot) {
        TodayApodState? state = snapshot.data;
        Widget body = Container();

        if (state is LoadingTodayApodState) {
          body = const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is ErrorTodayApodState){
          body = const Center(
            child: Text("Deu erro"),
          );
        }

        else if (state is SuccessTodayApodState){
          body = Column(
            children: [
              Text(state.apod.title ?? ''),
              Text(state.apod.explanation ?? '') 
            ],
          );
        }

        return Scaffold(
          body: body,
        );
      });
  }
}