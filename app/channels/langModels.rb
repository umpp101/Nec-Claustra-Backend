# This checks the available language models
curl --user "apikey:***" "https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/models?version=2018-05-01"

# to ruby 
uri = URI.parse("https://api.us-south.language-translator.watson.cloud.ibm.com/instances/71520e26-af24-4dd7-97d9-8e9135217e55/v3/models?version=2018-05-01")
request = Net::HTTP::Get.new(uri)
request.basic_auth("apikey", "***")

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

#result

# aparently the status of these lang pairs could have various values, like [uploading,uploaded,dispatching,queued,training,trained,publishing,available,deleted,error]
# according to the docs

{
    "models" : [ {
      "model_id" : "en-tr",
      "source" : "en",
      "target" : "tr",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-tr",
      "training_log" : null
    }, {
      "model_id" : "en-he",
      "source" : "en",
      "target" : "he",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-he",
      "training_log" : null
    }, {
      "model_id" : "en-da",
      "source" : "en",
      "target" : "da",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-da",
      "training_log" : null
    }, {
      "model_id" : "ca-es",
      "source" : "ca",
      "target" : "es",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ca-es",
      "training_log" : null
    }, {
      "model_id" : "es-en",
      "source" : "es",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "es-en",
      "training_log" : null
    }, {
      "model_id" : "en-hi",
      "source" : "en",
      "target" : "hi",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-hi",
      "training_log" : null
    }, {
      "model_id" : "en-de",
      "source" : "en",
      "target" : "de",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-de",
      "training_log" : null
    }, {
      "model_id" : "hr-en",
      "source" : "hr",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "hr-en",
      "training_log" : null
    }, {
      "model_id" : "en-pt",
      "source" : "en",
      "target" : "pt",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-pt",
      "training_log" : null
    }, {
      "model_id" : "en-zh-TW",
      "source" : "en",
      "target" : "zh-TW",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-zh-TW",
      "training_log" : null
    }, {
      "model_id" : "nl-en",
      "source" : "nl",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "nl-en",
      "training_log" : null
    }, {
      "model_id" : "en-lt",
      "source" : "en",
      "target" : "lt",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-lt",
      "training_log" : null
    }, {
      "model_id" : "lt-en",
      "source" : "lt",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "lt-en",
      "training_log" : null
    }, {
      "model_id" : "en-lv",
      "source" : "en",
      "target" : "lv",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-lv",
      "training_log" : null
    }, {
      "model_id" : "en-hr",
      "source" : "en",
      "target" : "hr",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-hr",
      "training_log" : null
    }, {
      "model_id" : "vi-en",
      "source" : "vi",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "vi-en",
      "training_log" : null
    }, {
      "model_id" : "fr-de",
      "source" : "fr",
      "target" : "de",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "fr-de",
      "training_log" : null
    }, {
      "model_id" : "en-hu",
      "source" : "en",
      "target" : "hu",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-hu",
      "training_log" : null
    }, {
      "model_id" : "de-fr",
      "source" : "de",
      "target" : "fr",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "de-fr",
      "training_log" : null
    }, {
      "model_id" : "zh-TW-en",
      "source" : "zh-TW",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "zh-TW-en",
      "training_log" : null
    }, {
      "model_id" : "ja-en",
      "source" : "ja",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ja-en",
      "training_log" : null
    }, {
      "model_id" : "en-id",
      "source" : "en",
      "target" : "id",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-id",
      "training_log" : null
    }, {
      "model_id" : "zh-en",
      "source" : "zh",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "zh-en",
      "training_log" : null
    }, {
      "model_id" : "en-ur",
      "source" : "en",
      "target" : "ur",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ur",
      "training_log" : null
    }, {
      "model_id" : "ro-en",
      "source" : "ro",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ro-en",
      "training_log" : null
    }, {
      "model_id" : "en-ms",
      "source" : "en",
      "target" : "ms",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ms",
      "training_log" : null
    }, {
      "model_id" : "en-el",
      "source" : "en",
      "target" : "el",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-el",
      "training_log" : null
    }, {
      "model_id" : "es-fr",
      "source" : "es",
      "target" : "fr",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "es-fr",
      "training_log" : null
    }, {
      "model_id" : "en-it",
      "source" : "en",
      "target" : "it",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-it",
      "training_log" : null
    }, {
      "model_id" : "en-es",
      "source" : "en",
      "target" : "es",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-es",
      "training_log" : null
    }, {
      "model_id" : "en-zh",
      "source" : "en",
      "target" : "zh",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-zh",
      "training_log" : null
    }, {
      "model_id" : "en-et",
      "source" : "en",
      "target" : "et",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-et",
      "training_log" : null
    }, {
      "model_id" : "da-en",
      "source" : "da",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "da-en",
      "training_log" : null
    }, {
      "model_id" : "en-ar",
      "source" : "en",
      "target" : "ar",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ar",
      "training_log" : null
    }, {
      "model_id" : "en-nb",
      "source" : "en",
      "target" : "nb",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-nb",
      "training_log" : null
    }, {
      "model_id" : "en-vi",
      "source" : "en",
      "target" : "vi",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-vi",
      "training_log" : null
    }, {
      "model_id" : "fr-en",
      "source" : "fr",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "fr-en",
      "training_log" : null
    }, {
      "model_id" : "es-ca",
      "source" : "es",
      "target" : "ca",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "es-ca",
      "training_log" : null
    }, {
      "model_id" : "de-it",
      "source" : "de",
      "target" : "it",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "de-it",
      "training_log" : null
    }, {
      "model_id" : "sl-en",
      "source" : "sl",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "sl-en",
      "training_log" : null
    }, {
      "model_id" : "nb-en",
      "source" : "nb",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "nb-en",
      "training_log" : null
    }, {
      "model_id" : "de-en",
      "source" : "de",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "de-en",
      "training_log" : null
    }, {
      "model_id" : "en-ja",
      "source" : "en",
      "target" : "ja",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ja",
      "training_log" : null
    }, {
      "model_id" : "fr-es",
      "source" : "fr",
      "target" : "es",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "fr-es",
      "training_log" : null
    }, {
      "model_id" : "en-nl",
      "source" : "en",
      "target" : "nl",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-nl",
      "training_log" : null
    }, {
      "model_id" : "en-ro",
      "source" : "en",
      "target" : "ro",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ro",
      "training_log" : null
    }, {
      "model_id" : "lv-en",
      "source" : "lv",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "lv-en",
      "training_log" : null
    }, {
      "model_id" : "ga-en",
      "source" : "ga",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ga-en",
      "training_log" : null
    }, {
      "model_id" : "bg-en",
      "source" : "bg",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "bg-en",
      "training_log" : null
    }, {
      "model_id" : "en-fi",
      "source" : "en",
      "target" : "fi",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-fi",
      "training_log" : null
    }, {
      "model_id" : "en-ru",
      "source" : "en",
      "target" : "ru",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ru",
      "training_log" : null
    }, {
      "model_id" : "ko-en",
      "source" : "ko",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ko-en",
      "training_log" : null
    }, {
      "model_id" : "en-bg",
      "source" : "en",
      "target" : "bg",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-bg",
      "training_log" : null
    }, {
      "model_id" : "en-fr",
      "source" : "en",
      "target" : "fr",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-fr",
      "training_log" : null
    }, {
      "model_id" : "id-en",
      "source" : "id",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "id-en",
      "training_log" : null
    }, {
      "model_id" : "th-en",
      "source" : "th",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "th-en",
      "training_log" : null
    }, {
      "model_id" : "it-en",
      "source" : "it",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "it-en",
      "training_log" : null
    }, {
      "model_id" : "sk-en",
      "source" : "sk",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "sk-en",
      "training_log" : null
    }, {
      "model_id" : "en-sk",
      "source" : "en",
      "target" : "sk",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-sk",
      "training_log" : null
    }, {
      "model_id" : "en-ga",
      "source" : "en",
      "target" : "ga",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ga",
      "training_log" : null
    }, {
      "model_id" : "ur-en",
      "source" : "ur",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ur-en",
      "training_log" : null
    }, {
      "model_id" : "en-sl",
      "source" : "en",
      "target" : "sl",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-sl",
      "training_log" : null
    }, {
      "model_id" : "fi-en",
      "source" : "fi",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "fi-en",
      "training_log" : null
    }, {
      "model_id" : "tr-en",
      "source" : "tr",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "tr-en",
      "training_log" : null
    }, {
      "model_id" : "et-en",
      "source" : "et",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "et-en",
      "training_log" : null
    }, {
      "model_id" : "pl-en",
      "source" : "pl",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "pl-en",
      "training_log" : null
    }, {
      "model_id" : "en-ko",
      "source" : "en",
      "target" : "ko",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-ko",
      "training_log" : null
    }, {
      "model_id" : "en-sv",
      "source" : "en",
      "target" : "sv",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-sv",
      "training_log" : null
    }, {
      "model_id" : "hu-en",
      "source" : "hu",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "hu-en",
      "training_log" : null
    }, {
      "model_id" : "cs-en",
      "source" : "cs",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "cs-en",
      "training_log" : null
    }, {
      "model_id" : "ru-en",
      "source" : "ru",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ru-en",
      "training_log" : null
    }, {
      "model_id" : "pt-en",
      "source" : "pt",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "pt-en",
      "training_log" : null
    }, {
      "model_id" : "ar-en",
      "source" : "ar",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ar-en",
      "training_log" : null
    }, {
      "model_id" : "el-en",
      "source" : "el",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "el-en",
      "training_log" : null
    }, {
      "model_id" : "he-en",
      "source" : "he",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "he-en",
      "training_log" : null
    }, {
      "model_id" : "en-cs",
      "source" : "en",
      "target" : "cs",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-cs",
      "training_log" : null
    }, {
      "model_id" : "en-th",
      "source" : "en",
      "target" : "th",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-th",
      "training_log" : null
    }, {
      "model_id" : "sv-en",
      "source" : "sv",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "sv-en",
      "training_log" : null
    }, {
      "model_id" : "ms-en",
      "source" : "ms",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "ms-en",
      "training_log" : null
    }, {
      "model_id" : "hi-en",
      "source" : "hi",
      "target" : "en",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "hi-en",
      "training_log" : null
    }, {
      "model_id" : "en-pl",
      "source" : "en",
      "target" : "pl",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "en-pl",
      "training_log" : null
    }, {
      "model_id" : "it-de",
      "source" : "it",
      "target" : "de",
      "base_model_id" : "",
      "domain" : "general",
      "customizable" : true,
      "default_model" : true,
      "owner" : "",
      "status" : "available",
      "name" : "it-de",
      "training_log" : null
    } ]
  }