void main(List<String> args){
  Parejas(int.parse(args[0]));
}

//Funcion principal que calculara las parejas de Primos
Parejas(int n){
  //Primero creo la lista de primos
  List<int> primos= calcPrimos(n);
  //Muestro los numeros primos
  print(primos);
  //Bucle que recorre todos los primos enpezando en 1 ya que harre los calculos basandome en el indice actual y el anterior
  for(int i=1; i<primos.length; i++){
    //Calculo si la diferencia del numero actual menos el anterior es 2
    if((primos[i]-primos[i-1])==2){
      //Si lo es imprimo la pareja de menor a mayor
      print("${primos[i-1]} i ${primos[i]}");
    }
  }
}

//Funcion que calcula los numeros primos hasta un int n y los devuelve en una lista
List<int> calcPrimos(int n) {
  List<int> primos=[];
  //Recoro los numeros hasta el parametro n saltandome 0 i 1 ya que no son primos.
  for(int i=2;i<n;i++){
    //Si el numero es primo lo añado a la lista
    if(esPrimo(i)){
      primos.add(i);
    }
  }
  return primos;//Devuelvo la lista
}

//Funcion que devuelve si un nummeo es primo o no
bool esPrimo(int a){
  //Recore todos los numeros hasta la mitad del introducido, porque apartir de la mitad el modulo nunca sera 0
  for(int i=2;i<=a/2;i++) {
    //Si el modulo es 0 es divisible por ese numero, y por definicion no es primo
    if(a%i==0)
      return false;
  }
  return true;//Si ha llegado hasta aqui el numero sera primo
}