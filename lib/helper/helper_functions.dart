double convertStringTodouble(String String){
  double? amount = double.tryParse(String);
  return amount ?? 0;
}