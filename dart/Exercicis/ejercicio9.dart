void main() {
    int a=4;
    print(" "+("--- "*a));
    for(int i = 0; i<a; i++){
        print("|   "*(a+1));
        print(" "+("--- "*a));
    }
}