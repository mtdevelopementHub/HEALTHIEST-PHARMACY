import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:healthiest/models/buyerMedicineSearchModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BuyerNetwork extends GetxService {
  var baseUrl = 'https://pharmacy.alruya.link';
  var endPointBuyerRegister = '/api/v1/customer/register';
  var endPointBuyerLogin = '/api/v1/customer/login';
  var endPointBuyerMedicineDefault = '/api/v1/customer/default-medicines';
  var endPointBuyerCatoriesMedicine = '/api/v1/customer/category-medicines';
  var endPointBuyerMedicineSearch = '/api/v1/customer/search-medicines';
  var endPointBuyerNearBylocation = '/api/v1/customer/nearest-medicines';
  var endPointBuyerViewMedicine = '/api/v1/customer/view-medicine';
  var endPointprescription = '/api/v1/customer/add-prescription';
  var endPointOrderCreate = '/api/v1/customer/order/create';
  var endPointOrderHistory= '/api/v1/customer/order/list';

  var endPointSearchNearBYMedicine =
      '/api/v1/customer/search-nearest-medicines';
  var endPointBuyerLogout = '/api/v1/logout';

  Future<void> saveTokenToPrefs(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apiToken', token);
  }

  Future<String?> getTokenFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('apiToken');
  }

  Future buyerRegister(String name, String email, String password) async {
    //  String? apiToken = await getTokenFromPrefs();
    var url = Uri.parse(baseUrl + endPointBuyerRegister);
    var text = {
      "name": name,
      "email": email,
      "password": password,
    };
    var response = await http.post(
      url,
      body: text,
    );
    print('Hassaan');
    print(response);
  }

  Future buyerLogin(
    String email,
    String password,
  ) async {
    var url = Uri.parse(baseUrl + endPointBuyerLogin);
    var register = {
      "email": email.toString(),
      "password": password.toString(),
    };
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      var response = await http.post(
        url,
        body: register,
      );
      if (response.statusCode == 200) {
        final resData = json.decode(response.body);
        print(resData['data']['message']);

        print(resData['data']['token']);

        await sharedPreferences.setString('token', resData['data']['token']);

        final sharedToken = sharedPreferences.getString('token');
        print(sharedToken);
        saveTokenToPrefs(sharedToken.toString());
        String? apiToken = await getTokenFromPrefs();

        return resData;
      } else {}
    } catch (e) {
      throw Exception();
    }

    return null;
  }

  Future getMedicineDefault() async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse(baseUrl + endPointBuyerMedicineDefault);
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $apiToken',
      "ngrok-skip-browser-warning": "54310"
    });

    try {
      if (response.statusCode == 200) {
        logFormatedJsonResponse(jsonData: jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('fail');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future buyerCategoryMedicines(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endPointBuyerCatoriesMedicine}/$id");
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $apiToken',
      "ngrok-skip-browser-warning": "54310"
    });

    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        logFormatedJsonResponse(jsonData: jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('fail');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///old
  Future buyerMedicineSearch(String text) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endPointBuyerMedicineSearch}/$text");
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $apiToken',
      "ngrok-skip-browser-warning": "54310"
    });

    print(response.statusCode);
    print(response.body);
    // Print the response body for debugging

    try {
      if (response.statusCode == 200) {
        logFormatedJsonResponse(jsonData: jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('fail');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

//new

  Future<Map<String, dynamic>?> orderCr(final data, String text1) async {
    String? apiToken = await getTokenFromPrefs();
    var url = Uri.parse("${baseUrl + endPointSearchNearBYMedicine}/$text1");
    var text = {
      'data': data,
    };
    var response = await http.post(url, body: text, headers: {
      'Authorization': 'Bearer $apiToken',
    });
    print(response);
    try {
      if (response.statusCode == 200) {
        final res = response;
        var responseData = jsonDecode(response.body);

        print(responseData);
        return responseData;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future buyerNearLocation(double latitude, double longitude) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse(
        "${baseUrl + endPointBuyerNearBylocation}/$latitude/$longitude");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $apiToken',
        "ngrok-skip-browser-warning": "54310"
      },
      // body: jsonEncode({
      //   "latitude":latitude,
      //   "longitude":longitude
      // })
    );

    print(response.statusCode);
    print(response.body);
    // Print the response body for debugging

    try {
      if (response.statusCode == 200) {
        logFormatedJsonResponse(jsonData: jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('fail');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future buyerViewMedicine(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endPointBuyerViewMedicine}/$id");
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $apiToken',
      "ngrok-skip-browser-warning": "54310"
    });

    print(response.statusCode);
    print(response.body);
    // Print the response body for debugging

    try {
      if (response.statusCode == 200) {
        logFormatedJsonResponse(jsonData: jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('fail');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future presciptionUpload(
    String medicine_id,
    image,
  ) async {
    String? apiToken = await getTokenFromPrefs();

    final uri = Uri.parse('${baseUrl + endPointprescription}/$medicine_id');

    var request = http.MultipartRequest('POST', uri);

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
      ));
    }
    request.headers['Authorization'] = 'Bearer $apiToken';

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // Handle successful response
        print('Success: $responseData');
        return responseData;
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }

//
  }

  Future orderCreate(
      String pharmacy_id,
      String name,
      String contactNumber,
      String email,
      String price,
      String address,
      String quantity,
      String payment_method) async {
    String? apiToken = await getTokenFromPrefs();
    var url = Uri.parse(baseUrl + endPointOrderCreate);
    var text = {
      'medicine_id': pharmacy_id,
      "name": name,
      "contact_no": contactNumber,
      "email": email,
      "price": price,
      "address": address,
      "quantity": quantity,
      "payment_method": payment_method,
    };
    var response = await http.post(url, body: text, headers: {
      'Authorization': 'Bearer $apiToken',
    });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      print(responseData);
      return responseData;
    }
  }

  Future buyerLogout() async {
    String? apiToken = await getTokenFromPrefs();
    var url = Uri.parse(baseUrl + endPointBuyerLogout);

    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $apiToken',
    });
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');

      return;
    }
  }
    Future getOrderHistory() async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse(baseUrl + endPointOrderHistory);
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $apiToken',
      "ngrok-skip-browser-warning": "54310"
    });

    try {
      if (response.statusCode == 200) {
        logFormatedJsonResponse(jsonData: jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('fail');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

void logFormatedJsonResponse({required dynamic jsonData}) {
  var object = json.decode(jsonEncode(jsonData));
  var prettyString = const JsonEncoder.withIndent('  ').convert(object);
  log(prettyString);
}
