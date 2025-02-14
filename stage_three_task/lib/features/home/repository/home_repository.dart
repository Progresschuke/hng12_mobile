import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../consts/app_url.dart';
import '../../../utils/utils.dart';
import '../model/country_model.dart';

class HomeRepository {
  Future<NetworkResponse> fetchCountries() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.fetchCountry),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final countryModel = countryModelFromJson(response.body);
        print(countryModel.length);

        return NetworkResponse(
            status: RequestStatus.success, data: countryModel);
      } else {
        return NetworkResponse(
            status: RequestStatus.failed, message: 'Failed to fetch countries');
      }
    } on TimeoutException catch (e) {
      debugPrint("timeout exception $e");
      return NetworkResponse(
          status: RequestStatus.failed, message: 'Timeout error');
    } on http.ClientException catch (e) {
      debugPrint("client exception $e");
      return NetworkResponse(
          status: RequestStatus.failed,
          message: 'Check your network connection');
    } catch (e) {
      debugPrint('Fetching Shared Campaign error: $e');
    }
    return NetworkResponse(
        status: RequestStatus.failed, message: 'An error occurred');
  }
}
