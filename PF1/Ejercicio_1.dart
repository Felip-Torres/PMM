void main(List<String> args){
  //Meto en variables y convierto a entero los parametros
  int hora= int.parse(args[0]);
  int minuto= int.parse(args[1]);
  int segundo= int.parse(args[2]);
  //Ejecuto la funcion que hara los calculos y mostrara por pantalla la hora
  Reloj(hora,minuto,segundo);
}

//Recibe horas, minutos y segundos, calcula el exedente de segundos y minutos y devuelve por pantalla la hora en formato hh:mm:ss
Reloj(int horas, int minutos, int segundos){
  //Mientras los segundos desborden resto 60 a segundos y añado un minuto
  while(segundos>=60){
    segundos -= 60;
    minutos++;
  }
  //Lo mismo para minutos y horas
  while(minutos>=60){
    minutos -= 60;
    horas++;
  }

  //Si la hora supera las 24 seria un cambio de dia por que en este programa seria un error
  if(horas>=24){
    print("ERROR: La fecha supera las 24h");
  }else{
    //Utilizo el padLeft para añadir 0 cuando son numero de 1 digito.
    print("${horas.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}");
  }
}