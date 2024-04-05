import 'package:http/http.dart' as http;
import 'dart:convert';

class Data {
  String page;
  String pages;
  String role;
  String time;

  Data(this.page, this.pages, this.role, this.time);
  Future<List<dynamic>> getData() async {
    List<dynamic> data = [];
    try {
      final response = await http.get(
          Uri.parse(
              'https://jsearch.p.rapidapi.com/search?query=$role&page=$page&num_pages=$pages&date_posted=$time'),
          headers: {
            'X-RapidAPI-Key': '',
            'X-RapidAPI-Host': 'jsearch.p.rapidapi.com'
          });

      if (response.statusCode == 200) {
        data = jsonDecode(response.body)['data'];
      }
    } catch (e) {
      print(e);
    }
    return data;
  }
}
