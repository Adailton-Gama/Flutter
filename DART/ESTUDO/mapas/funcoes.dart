void main(){
  Map<int, String?> ddds = {
    11: 'São Paulo',
    19: 'Campinas',
    41: 'Curitiba',
    74: 'Bahia',
    75: 'Bahia',
    49: null,
  };
  print(ddds[11]);

  print(ddds.length);

  ddds[61] = 'Brasilia';
  ddds.remove(49);

  print(ddds.values);
  print(ddds.keys);

  print(ddds.containsKey(11));
  print(ddds.containsValue('São Paulo'));

  ddds.isEmpty;
  ddds.isNotEmpty;
  
  ddds.forEach((key, value) {
    print('Key: $key Value: $value');
  });

  ddds.addAll({87: 'Petrolina', 91: 'Other City'});
  print(ddds);

  ddds.removeWhere((key, value) => key > 20);
  print(ddds);

  String dddcidade = ddds[13] ?? 'Não infomadado';
  String dddcidade2 = ddds[11]!; //Null Assertion
  print(dddcidade.toUpperCase());
  print(dddcidade2.toUpperCase());
}