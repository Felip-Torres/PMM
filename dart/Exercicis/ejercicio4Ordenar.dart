void main() {
    int a,b,c;
    a=2;
    b=5;
    c=3;
    if(a<b){
      if(a<c && c<b){
        print("${b} ${c} ${a}");
      }else if(a>c){
        print("${b} ${a} ${c}");
      }else if(b<c){
        print("${c} ${b} ${a}");
      }
    }else if(a>b){
      if(a>c && c>b){
        print("${a} ${c} ${b}");
      }else if(b>c){
        print("${a} ${b} ${c}");
      }else if(a<c){
        print("${c} ${a} ${b}");
      }
    }
}