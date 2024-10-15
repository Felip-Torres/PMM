void main() {
    String texto = "Anita lava la tina";

    if (esPalindromo(texto)) {
      print('La cadena es un palíndromo.');
    } else {
      print('La cadena no es un palíndromo.');
    }
}
bool esPalindromo(String texto) {
  texto = texto.replaceAll(' ', '').toLowerCase();
  for(int i=0; i<texto.length/2; i++){
    if (texto[i] != texto[(texto.length-1)-i]){
      return false;
    }
  }
  return true;
}