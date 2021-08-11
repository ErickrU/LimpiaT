void main(){
var lst = ["Yael","Arturo","Jose luis"];
  print(formato(lst));
}

  String formato(var lst){
    String str = "";
    for (var i =0; i<= lst.length-1; i++){
      str += lst[i];
      str += "\n";
    }
    return str;
  }
