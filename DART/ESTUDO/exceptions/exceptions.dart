void main(){
  try{
  int res = 100 ~/ 0;
  print(res);
  }catch(e){
    print(e);
  }
  print('final');
}