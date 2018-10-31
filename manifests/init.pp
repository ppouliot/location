class geolocation ( 
  $baseurl = "http://api.ipstack.com/check/?access_key=",
  $filename = "location.json"
  $api_access_key
  ) {
  
  # Request format for ipstack.com
  # http://api.ipstack.com/134.201.250.155
  #  ? access_key = YOUR_ACCESS_KEY
  # 
  # http://api.ipstack.com/check?access_key=<API_TOKEN>
  # 
  url = "${baseurl}${api_access_key}"
  fetchfact::fetch { '$filename':
    url => $url,
    factfile => $filename
  }
}  
