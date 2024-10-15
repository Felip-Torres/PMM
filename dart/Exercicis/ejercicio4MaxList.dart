void main() {
    List<int> num=[5,1,2,3,1,4,5,6,34,2,346,7,6,8,5];
    int max, min;
    max=num[0];
    min=max;
    for(int i=1; i<num.length; i++){
        if(num[i]>max)max=num[i];
        if(num[i]<min)min=num[i];
    }
    print(min);
    print(max);
}