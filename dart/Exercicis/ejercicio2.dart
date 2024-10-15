void main() {
  var num=[1,2,3,1,4,5,6,34,2,346,7,6,8,5];
  var num2=[1,2,4,6,3,7,8,9,3,4,5,3,12,4233,346,24,34];

  var A = num.toSet();
  var B = num2.toSet();

  var inter=A.intersection(B);

  print(inter.toList());
}
