void main() {
    String cad="El meu nom és Jaume";
    List<String> palabras=cad.split(" ");
    cad='';
    for(int i=palabras.length; i>0;i--){
        cad+=palabras[i-1] + " ";
    }
    print(cad);
}