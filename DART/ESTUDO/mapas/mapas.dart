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
	
	print(ddds.isEmpty);
	print(ddds.isNotEmpty);
}