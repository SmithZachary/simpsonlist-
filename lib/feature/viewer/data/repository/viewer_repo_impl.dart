import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:viewer/core/constant/string_constant.dart';
import 'package:viewer/core/exception/exception.dart';
import 'package:http/http.dart' as http;
import 'package:viewer/feature/viewer/domain/model/viewer.dart';
import 'package:viewer/feature/viewer/domain/repository/viewer_repo.dart';
import 'package:viewer/flavors.dart';

class ViewerRepoImpl extends ViewerRepo {
  @override
  Future<Viewer?> fetchViewer() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final response = await http
            .get(Uri.parse('${StringConstant.apiUrl}${F.queryParameter}'));
        if (response.statusCode == 200) {
          final result = jsonDecode(response.body) as Map?;
          return Viewer.fromJson(result as Map<String, dynamic>);
        }
        throw Exception(response);
      } else {
        throw AppException('No internet connection');
      }
    } catch (e) {
      rethrow;
    }
  }
}
