

class ApiRequestGenirator{
  
  String requestUrlPrefix = "http://localhost:8000/api/";

  String  genirateUrl(String sufix){
    return requestUrlPrefix+sufix;
  }
}