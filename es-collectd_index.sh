curl -XPUT "${ES_HOST:-localhost}:${ES_PORT:-9200}/_template/collectd-template" -H "Content-Type: application/json" -d '
{
    "index_patterns" : "collectd-*",
    "settings" : {
        "index" : {
          "refresh_interval" : "5s"
        }
    },
    "mappings" : {
      "doc" : {
        "properties" : {
          "@timestamp" : { "type" : "date" },
          "@version" :  { "type" : "keyword" },
          "collectd_type" : { "type" : "keyword" },
          "host" : { "type" : "keyword" },
          "io_time" : { "type" : "long" },
          "longterm" : { "type" : "float" },
          "majflt" : { "type" : "long" },
          "message" : { "type" : "keyword" },
          "midterm" : { "type" : "float" },
          "minflt" : { "type" : "long" },
          "plugin" : { "type" : "keyword" },
          "plugin_instance" : { "type" : "keyword" },
          "processes" : { "type" : "float" },
          "read" : { "type" : "long" },
          "rx" : { "type" : "long" },
          "severity" : { "type" : "long" },
          "shortterm" : { "type" : "float" },
          "syst" : { "type" : "long" },
          "tags" : { "type" : "keyword" },
          "threads" : { "type" : "float" },
          "tx" : { "type" : "long" },
          "type_instance" : { "type" : "keyword" },
          "user" : { "type" : "long" },
          "value" : { "type" : "double" },
          "weighted_io_time" : { "type" : "long" },
          "write" : { "type" : "long" }
        }
      }
    }
}'
