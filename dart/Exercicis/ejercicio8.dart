import 'dart:math';

String generarContrasenya(int longitud) {
  const String caracters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();  // Utilitzem Random() normal

  String contrasenya = '';
  for (int i = 0; i < longitud; i++) {
    contrasenya += caracters[random.nextInt(caracters.length)];
  }

  return contrasenya;
}

void main() {
  int longitud = 12;  // Canvia aquest valor per la longitud desitjada
  String contrasenya = generarContrasenya(longitud);

  print('Contrasenya generada: $contrasenya');
}