#how it identifies a language
curl -X 
POST 
-u "apikey:QEVaJ9BoO35X9Rdn-LgyEBM5loerbPalf07VO_S63Kqg" 
--header "Content-Type: text/plain" 
--data "Some Random Text Here" 
"https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/identify?version=2018-05-01"


#to ruby
uri = URI.parse("https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/identify?version=2018-05-01")
request = Net::HTTP::Post.new(uri)
request.basic_auth("apikey", "QEVaJ9BoO35X9Rdn-LgyEBM5loerbPalf07VO_S63Kqg")
# request.content_type = "text/plain"
request.content_type = "application/json"
request.body = "Some Random English Text Here"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

#Result

{
    "languages" : [ {
      "language" : "en",
      "confidence" : 0.9999983522703445
    }, {
      "language" : "nb",
      "confidence" : 7.830834755376996E-7
    }, {
      "language" : "nn",
      "confidence" : 3.9648775577341237E-7
    }, {
      "language" : "da",
      "confidence" : 1.9983909678555728E-7
    }, {
      "language" : "de",
      "confidence" : 9.13331207514015E-8
    }, {
      "language" : "pt",
      "confidence" : 7.64267646110437E-8
    }, {
      "language" : "sq",
      "confidence" : 2.2339397536206627E-8
    }, {
      "language" : "sk",
      "confidence" : 1.6935062209737556E-8
    }, {
      "language" : "sv",
      "confidence" : 8.044911904741323E-9
    }, {
      "language" : "af",
      "confidence" : 6.689861050907492E-9
    }, {
      "language" : "fr",
      "confidence" : 5.788170985075327E-9
    }, {
      "language" : "et",
      "confidence" : 5.360526352686322E-9
    }, {
      "language" : "ht",
      "confidence" : 5.230401442470709E-9
    }, {
      "language" : "nl",
      "confidence" : 4.975848818520956E-9
    }, {
      "language" : "ro",
      "confidence" : 4.261331535547968E-9
    }, {
      "language" : "eo",
      "confidence" : 4.194458231957992E-9
    }, {
      "language" : "ca",
      "confidence" : 3.946438880877247E-9
    }, {
      "language" : "hr",
      "confidence" : 2.26225477447146E-9
    }, {
      "language" : "is",
      "confidence" : 1.5145359230456152E-9
    }, {
      "language" : "ga",
      "confidence" : 1.4388813929442943E-9
    }, {
      "language" : "cs",
      "confidence" : 1.0105702441077007E-9
    }, {
      "language" : "pl",
      "confidence" : 9.158198446387034E-10
    }, {
      "language" : "eu",
      "confidence" : 8.477640821361696E-10
    }, {
      "language" : "sl",
      "confidence" : 7.996705168460991E-10
    }, {
      "language" : "vi",
      "confidence" : 7.908257214340353E-10
    }, {
      "language" : "hu",
      "confidence" : 7.006273371209835E-10
    }, {
      "language" : "ku",
      "confidence" : 6.618882822873717E-10
    }, {
      "language" : "es",
      "confidence" : 6.336490530709431E-10
    }, {
      "language" : "fi",
      "confidence" : 3.5363685415146767E-10
    }, {
      "language" : "lv",
      "confidence" : 2.441916380133641E-10
    }, {
      "language" : "tr",
      "confidence" : 1.9149952252768305E-10
    }, {
      "language" : "ms",
      "confidence" : 1.5797863094166994E-10
    }, {
      "language" : "az",
      "confidence" : 9.405278728439228E-11
    }, {
      "language" : "lt",
      "confidence" : 7.55557078864422E-11
    }, {
      "language" : "it",
      "confidence" : 3.4330102117659915E-11
    }, {
      "language" : "ja",
      "confidence" : 1.8411483515247803E-11
    }, {
      "language" : "mt",
      "confidence" : 1.3014058838191894E-11
    }, {
      "language" : "so",
      "confidence" : 9.961348846367592E-12
    }, {
      "language" : "zh",
      "confidence" : 9.832775344944089E-12
    }, {
      "language" : "zh-TW",
      "confidence" : 9.466112720714603E-12
    }, {
      "language" : "ko",
      "confidence" : 2.041265739663143E-12
    }, {
      "language" : "th",
      "confidence" : 1.2601162569393817E-12
    }, {
      "language" : "hi",
      "confidence" : 3.43722947988917E-13
    }, {
      "language" : "el",
      "confidence" : 2.2162372983232247E-13
    }, {
      "language" : "ur",
      "confidence" : 1.9189563420016495E-13
    }, {
      "language" : "mn",
      "confidence" : 8.241613889565685E-14
    }, {
      "language" : "sr",
      "confidence" : 7.227846385994746E-14
    }, {
      "language" : "km",
      "confidence" : 6.811975594151817E-14
    }, {
      "language" : "ar",
      "confidence" : 3.828686903217528E-14
    }, {
      "language" : "he",
      "confidence" : 3.135605477925186E-14
    }, {
      "language" : "ka",
      "confidence" : 3.0970289041964053E-14
    }, {
      "language" : "bn",
      "confidence" : 2.9238304175942904E-14
    }, {
      "language" : "ky",
      "confidence" : 2.852123904159662E-14
    }, {
      "language" : "pa",
      "confidence" : 2.167245767867717E-14
    }, {
      "language" : "ru",
      "confidence" : 1.8494538669056908E-14
    }, {
      "language" : "ta",
      "confidence" : 1.613387854468554E-14
    }, {
      "language" : "uk",
      "confidence" : 1.5273101103100754E-14
    }, {
      "language" : "bg",
      "confidence" : 1.4495693581902916E-14
    }, {
      "language" : "ml",
      "confidence" : 1.2992653196009366E-14
    }, {
      "language" : "ps",
      "confidence" : 1.2926606985260068E-14
    }, {
      "language" : "te",
      "confidence" : 1.158720687102964E-14
    }, {
      "language" : "be",
      "confidence" : 1.0450240080375936E-14
    }, {
      "language" : "fa",
      "confidence" : 9.793889725648497E-15
    }, {
      "language" : "kk",
      "confidence" : 9.761737302356912E-15
    }, {
      "language" : "hy",
      "confidence" : 8.503325117222467E-15
    }, {
      "language" : "ba",
      "confidence" : 5.808116776378653E-15
    }, {
      "language" : "cv",
      "confidence" : 4.1339910717265804E-15
    }, {
      "language" : "gu",
      "confidence" : 3.2155501536580324E-15
    } ]







