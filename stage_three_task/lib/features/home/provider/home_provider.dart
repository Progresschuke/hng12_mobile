import 'package:flutter/material.dart';
import 'package:stage_three_task/features/home/model/country_model.dart';

import '../../../utils/utils.dart';
import '../repository/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository _homeRepository = HomeRepository();

  //Objects
  RequestStatus _status = RequestStatus.initial;
  RequestStatus _fetchingCountriesStatus = RequestStatus.initial;
  String message = "";
  List<CountryModel>? _countryModel;

  //Getters
  RequestStatus get status => _status;
  RequestStatus get fetchingCountriesStatus => _fetchingCountriesStatus;
  List<CountryModel>? get countryModel => _countryModel;

  Future<void> fetchCountries() async {
    if (_fetchingCountriesStatus == RequestStatus.loading) {
      return;
    }
    message = "Just a sec...";
    _fetchingCountriesStatus = RequestStatus.loading;
    notifyListeners();
    final response = await _homeRepository.fetchCountries();

    if (response.status == RequestStatus.success) {
      _fetchingCountriesStatus = response.status;
      _countryModel = response.data;
      message = "Fetching Countries Successful";
      notifyListeners();
    } else {
      _fetchingCountriesStatus = response.status;
      message = 'Failed to fetch countries';
      notifyListeners();
    }
  }
}
