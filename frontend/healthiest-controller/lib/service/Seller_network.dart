import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SellerNetwork extends GetxService {
  var baseUrl = 'https://pharmacy.alruya.link';
  var endPointRegister = '/api/v1/seller/register';
  var endpointLogin = "/api/v1/seller/login";
  var endpointSellerPharmacy = '/api/v1/pharmacy/add';
  var endpointGetPharmcy = '/api/v1/pharmacy/list';
  var endpointGetUpdatePharmcy = '/api/v1/pharmacy/edit';
  var endpointPostUpdatePharmcy = '/api/v1/pharmacy/update';
  var endpointDeletePharmcy = '/api/v1/pharmacy/delete';
  var endpointAddMedicine = '/api/v1/medicine/add';
  var endpointGEtMedicine = '/api/v1/medicine/list';
  var endpointGetRider = '/api/v1/seller/riders';
  var endpointMedicinePresciptions = '/api/v1/medicine/prescriptions';
  var endpointGetOrderMedicine = '/api/v1/pharmacy/orders';
  var endpointAddRider = '/api/v1/seller/add-rider';
  var endpointdeleteRider = '/api/v1/seller/delete-rider';
    var endPointSellerLogout = '/api/v1/logout';
    var endPointSellerUpdateMedicine = '/api/v1/medicine/update';

  Future<void> saveTokenToPrefs(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apiToken', token);
  }

  Future<String?> getTokenFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('apiToken');
  }

  Future textApi(String name, String email, String password) async {
    //  String? apiToken = await getTokenFromPrefs();
    var url = Uri.parse(baseUrl + endPointRegister);
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

  String? messagelogin;

  Future sellerLogin(
    String email,
    String password,
  ) async {
    var url = Uri.parse(baseUrl + endpointLogin);
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

        messagelogin = resData['data']['token'];

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

  // Future addPharmcy(String name, String contactNumber, String address) async {
  //   String? apiToken = await getTokenFromPrefs();
  //   var url = Uri.parse(baseUrl + endpointSellerPharmacy);
  //   var text = {
  //     "name": name,
  //     "contact_number": contactNumber,
  //     "location": address,
  //   };
  //   var response = await http.post(url, body: text, headers: {
  //     'Authorization': 'Bearer $apiToken',
  //   });
  //   print(response.body);
  // }

  Future addPharmcy(
    name,
    contactNumber,
    location,
    image,
  ) async {
    String? apiToken = await getTokenFromPrefs();

    //  final url = "${baseUrl + endpointAddMedicine}/$pharmacy_id";
    final uri = Uri.parse(baseUrl + endpointSellerPharmacy);

    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse(url),
    // );

    // Include the token in headers

    var request = http.MultipartRequest('POST', uri)
      ..fields['name'] = name
      ..fields['contact_number'] = contactNumber
      ..fields['location'] = location;

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        // contentType: MediaType('image', 'jpeg'),
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
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }
  }

  Future getPharmcy() async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse(baseUrl + endpointGetPharmcy);
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

  Future getUpdatePharmcy(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endpointGetUpdatePharmcy}/$id");
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




  Future addUpdatePharmcy(
      String id, String name, String contactNumber, String location , image) async {
    String? apiToken = await getTokenFromPrefs();




    var uri = Uri.parse("${baseUrl + endpointPostUpdatePharmcy}/$id");
    // final uri = Uri.parse(baseUrl + endpointSellerPharmacy);

    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse(url),
    // );

    // Include the token in headers

    var request = http.MultipartRequest('POST', uri)
      ..fields['name'] = name
      ..fields['contact_number'] = contactNumber
      ..fields['location'] = location;
      

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        // contentType: MediaType('image', 'jpeg'),
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
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }




  }








  Future deletePharmcy(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endpointDeletePharmcy}/$id");
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

  Future<void> postData(
    String pharmacy_id,
    name,
    dosage,
    price,
    formula,
    quantity,
    category_id,
    checkBoxValue,
    isVerified,
    description,
    image,
  ) async {
    String? apiToken = await getTokenFromPrefs();

    //  final url = "${baseUrl + endpointAddMedicine}/$pharmacy_id";
    final uri = Uri.parse('${baseUrl + endpointAddMedicine}/$pharmacy_id');

    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse(url),
    // );

    // Include the token in headers

    var request = http.MultipartRequest('POST', uri)
      ..fields['name'] = name
      ..fields['dosage'] = dosage
      ..fields['price'] = price
      ..fields['formula'] = formula
      ..fields['quantity'] = quantity
      ..fields['category_id'] = category_id.toString()
      ..fields['status'] = checkBoxValue.toString()
      ..fields['is_verified'] = isVerified.toString()
      ..fields['description'] = description.toString();

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        // contentType: MediaType('image', 'jpeg'),
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
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }
  }

  Future getMedicine(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endpointGEtMedicine}/${id}");
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

  Future getRider(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endpointGetRider}/$id");
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

  Future getMedicinePresciption(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endpointMedicinePresciptions}/${id}");
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

  Future getOrderMedicine(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endpointGetOrderMedicine}/${id}");
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

  Future addRider(
      String pharmacy_id, name, String contactNumber, String cnic) async {
    String? apiToken = await getTokenFromPrefs();
    var url = Uri.parse("${baseUrl + endpointAddRider}/${pharmacy_id}");
    var text = {
      "name": name,
      "contact_number": contactNumber,
      "cnic": cnic,
    };
    var response = await http.post(url, body: text, headers: {
      'Authorization': 'Bearer $apiToken',
    });
    print(response.body);
  }

  Future deleteRider(String id) async {
    String? apiToken = await getTokenFromPrefs();

    final url = Uri.parse("${baseUrl + endpointdeleteRider}/$id");
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

    Future sellerLogout() async {
    String? apiToken = await getTokenFromPrefs();
    var url = Uri.parse(baseUrl + endPointSellerLogout);

    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $apiToken',
    });
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');

      return;
    }
  }

    Future<void> updateMedicine(
      String pharmacy_id,
    String medicine_id,
    name,
    dosage,
    price,
    formula,
    quantity,
    category_id,
    checkBoxValue,
    isVerified,
    description,
    image,
  ) async {
    String? apiToken = await getTokenFromPrefs();

     // final url = "${baseUrl + endpointAddMedicine}/$medicine_id";
    final url = Uri.parse('${baseUrl +endPointSellerUpdateMedicine }/$medicine_id/$pharmacy_id');

    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse(url),
    // );

    // Include the token in headers

    var request = http.MultipartRequest('POST', url)
      ..fields['name'] = name
      ..fields['dosage'] = dosage
      ..fields['price'] = price
      ..fields['formula'] = formula
      ..fields['quantity'] = quantity
      ..fields['category_id'] = category_id.toString()
      ..fields['status'] = checkBoxValue.toString()
      ..fields['is_verified'] = isVerified.toString()
      ..fields['description'] = description.toString();

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        // contentType: MediaType('image', 'jpeg'),
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
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception caught: $e');
    }
  }



}

void logFormatedJsonResponse({required dynamic jsonData}) {
  var object = json.decode(jsonEncode(jsonData));
  var prettyString = const JsonEncoder.withIndent('  ').convert(object);
  log(prettyString);
}
