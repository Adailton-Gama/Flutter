import 'package:http/http.dart' as http;

void main() {
  http.get(
      Uri.parse('http://proxyapp.correios.com.br/v1/sro-rastro/NL131633460BR'));
      
}
