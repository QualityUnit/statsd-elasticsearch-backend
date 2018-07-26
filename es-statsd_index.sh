curl -XPUT "${ES_HOST:-localhost}:${ES_PORT:-9200}/_template/statsd-template" -H "Content-Type: application/json" -d '
{
    "index_patterns" : "statsd-*",
    "settings" : {
        "index" : {
          "refresh_interval" : "5s"
        }
    },
    "mappings" : {
      "statsd" : {
        "properties" : {
          "@timestamp" : { "type" : "date" },
          "application" : { "type" : "keyword" },
          "host" : { "type" : "keyword" },
          "account_id" : { "type" : "keyword" },
          "dc" : { "type" : "keyword" },
          "metric" : { "type" : "keyword" },
          "metric_type" : { "type" : "keyword" },
          "val" : { "type" : "float" },
          "count_90": { "type" : "float" },
          "mean_90": { "type" : "float" },
          "upper_90": { "type" : "float" },
          "sum_90": { "type": "float" },
          "sum_squares_90" : { "type": "float" },
          "std": { "type" : "float" },
          "upper" : { "type" : "float" },
          "lower" : { "type" : "float" },
          "count" : { "type" : "float" },
          "count_ps" : { "type" : "float" },
          "sum": { "type": "float" },
          "sum_squares": { "type": "float" },
          "mean": { "type": "float" },
          "median": { "type": "float" }
         }
      }
    }
}'
