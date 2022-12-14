import 'dart:convert';

import "package:http/http.dart" as http;

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}


const protocol = "http";

const domain = "192.168.1.100:8000";
//192.168.1.104
//172.19.249.16
// 172.19.69.201
 
Future<RequestResult> httpGet(String route, [dynamic data]) async
{
  var dataStr = jsonEncode(data);
  var url = "$protocol://$domain/$route?data=$dataStr";
  var result = await http.get(Uri.parse(url));
  return RequestResult(true, jsonDecode(result.body));
}


Future<RequestResult> httpPost(String route, [dynamic data]) async
{
  var url = "$protocol://$domain/$route";
  var dataStr = jsonEncode(data);
  var result = await http.post(Uri.parse(url), body: dataStr, headers:{"Content-Type":"application/json"});
  return RequestResult(true, jsonDecode(result.body));
}
