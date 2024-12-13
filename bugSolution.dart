```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        if (jsonData != null) {
          return jsonData;
        } else {
          //Handle specific null case
          throw Exception('JSON Decoding returned null');
        }
      } catch (e) {
        //Catch specific JSON decoding errors
        throw Exception('Error decoding JSON: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
```