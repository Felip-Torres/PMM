void main() {
    int a=10;
    int con=0;
    List<int> primos=[];
    for(int i=2;con<a;i++){
        if(esPrimo(i)){
            primos.add(i);
            con++;
        }
    }
}

bool esPrimo(int a){
    for(int i=2;i<a/2;i++) {
        if(a%i==0)
            return false;
    }
    return true;
}