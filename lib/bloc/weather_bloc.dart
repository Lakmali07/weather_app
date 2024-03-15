import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';

import '../data/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(WeatherFetched event, Emitter<WeatherState> emmit)async{
    emit(WeatherLoading());
    try{
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModelList: weather));
    }catch(e){
      emit(WeatherFailure(e.toString()));
    }
  }
}
