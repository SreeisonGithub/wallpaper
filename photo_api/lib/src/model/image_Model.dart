class ImageModel{
   String url,title;
   int id;
    
    ImageModel(this.id,this.url,this.title);
    ImageModel.fromJson(Map<String, dynamic> parsedJson){
      id = parsedJson[id];
      url = parsedJson[url];
      title = parsedJson[title];

    }

}