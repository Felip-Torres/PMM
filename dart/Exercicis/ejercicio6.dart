import 'dart:math';
void main() {
    int a=Random().nextInt(100)+1;
    print(a);
    print(esPrimo(a) ? "Es primo":"No es primo");
}

bool esPrimo(int a){
    for(int i=2;i<a/2;i++) {
        if(a%i==0)
            return false;
    }
    return true;
}