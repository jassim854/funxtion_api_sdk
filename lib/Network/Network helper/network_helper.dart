part of funxtion_sdk;
String? token;
Dio dio = Dio(BaseOptions(
  baseUrl: "https://api-staging.funxtion.com/v3/",
  headers: {
    "X-Scope": "platform",
    'Content-Type': 'application/json',
    "Authorization": token != null ? "Bearer $token" : ''
  },
));
DioCacheManager? _dioCacheManager;
class NetwoerkHelper{

 static showSnackbar(context,String text){

   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
 }
}