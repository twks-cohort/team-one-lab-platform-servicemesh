{
  "title": "EMPC lab-platform-eks-servicemesh",
  "description": "[lab-platform-eks-core-services](https://github.com/ThoughtWorks-DPS/lab-platform-eks-servicemesh)",
  "widgets": [
    {
      "definition": {
        "title": "Monitor Summary",
        "title_size": "13",
        "title_align": "left",
        "type": "manage_status",
        "display_format": "countsAndList",
        "color_preference": "text",
        "hide_zero_counts": true,
        "query": "tag:pipeline:lab-platform-servicemesh",
        "sort": "status,asc",
        "count": 50,
        "start": 0,
        "summary_type": "monitors",
        "show_priority": false,
        "show_last_triggered": false
      },
      "layout": {
        "x": 0,
        "y": 0,
        "width": 3,
        "height": 6
      }
    },
    {
      "definition": {
        "type": "note",
        "content": "Dependencies",
        "background_color": "gray",
        "font_size": "18",
        "text_align": "center",
        "vertical_align": "center",
        "show_tick": false,
        "tick_pos": "50%",
        "tick_edge": "left",
        "has_padding": true
      },
      "layout": {
        "x": 3,
        "y": 0,
        "width": 8,
        "height": 1
      }
    },
    {
      "definition": {
        "type": "note",
        "content": "CURRENT_TABLE",
        "background_color": "yellow",
        "font_size": "14",
        "text_align": "left",
        "vertical_align": "top",
        "show_tick": true,
        "tick_pos": "50%",
        "tick_edge": "left",
        "has_padding": true
      },
      "layout": {
        "x": 3,
        "y": 1,
        "width": 6,
        "height": 3
      }
    },
    {
      "definition": {
        "type": "note",
        "content": "LATEST_TABLE",
        "background_color": "TABLE_COLOR",
        "font_size": "14",
        "text_align": "left",
        "vertical_align": "top",
        "show_tick": true,
        "tick_pos": "50%",
        "tick_edge": "left",
        "has_padding": true
      },
      "layout": {
        "x": 9,
        "y": 1,
        "width": 2,
        "height": 3
      }
    },
    {
      "definition": {
        "title": "servicemesh system container restarts",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              },
              {
                "formula": "query2"
              },
              {
                "formula": "query3"
              },
              {
                "formula": "query4"
              },
              {
                "formula": "query5"
              },
              {
                "formula": "query6"
              },
              {
                "formula": "query7"
              },
              {
                "formula": "query8"
              },
              {
                "formula": "query9"
              },
              {
                "formula": "query10"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_deployment:istiod}",
                "data_source": "metrics",
                "name": "query1"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_deployment:istio-ingressgateway}",
                "data_source": "metrics",
                "name": "query2"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_deployment:external-dns}",
                "data_source": "metrics",
                "name": "query3"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_deployment:cert-manager}",
                "data_source": "metrics",
                "name": "query4"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_deployment:cert-manager-webhook}",
                "data_source": "metrics",
                "name": "query5"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_deployment:cert-manager-cainjector}",
                "data_source": "metrics",
                "name": "query6"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_container_name:kiali}",
                "data_source": "metrics",
                "name": "query7"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_container_name:jaeger}",
                "data_source": "metrics",
                "name": "query8"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_container_name:grafana}",
                "data_source": "metrics",
                "name": "query9"
              },
              {
                "query": "sum:kubernetes.containers.restarts{$cluster,kube_container_name:prometheus-server}",
                "data_source": "metrics",
                "name": "query10"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ],
        "events": [
          {
            "q": "tags:(cluster:$cluster.value),event:deployment",
            "tags_execution": "and"
          }
        ]
      },
      "layout": {
        "x": 3,
        "y": 4,
        "width": 8,
        "height": 2
      }
    },
    {
      "definition": {
        "type": "note",
        "content": "mesh services",
        "background_color": "gray",
        "font_size": "18",
        "text_align": "center",
        "vertical_align": "center",
        "show_tick": false,
        "tick_pos": "50%",
        "tick_edge": "left",
        "has_padding": true
      },
      "layout": {
        "x": 0,
        "y": 6,
        "width": 11,
        "height": 1
      }
    },
    {
      "definition": {
        "title": "Average Request size by Dest Container",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:istio.mesh.request.size.sum{$cluster} by {kube_container_name}",
                "data_source": "metrics",
                "name": "query1"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ],
        "events": [
          {
            "q": "cluster:$cluster.value, tag:event:deployment",
            "tags_execution": "and"
          }
        ]
      },
      "layout": {
        "x": 0,
        "y": 7,
        "width": 4,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "Average Request Duration by Dest Container",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:istio.mesh.request.duration.milliseconds.count{$cluster} by {kube_container_name}",
                "data_source": "metrics",
                "name": "query1"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ],
        "events": [
          {
            "q": "cluster:$cluster.value, tag:event:deployment",
            "tags_execution": "and"
          }
        ]
      },
      "layout": {
        "x": 4,
        "y": 7,
        "width": 3,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "Average Request Count by Dest Container",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:istio.mesh.request.size.count{$cluster} by {kube_container_name}",
                "data_source": "metrics",
                "name": "query1"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ]
      },
      "layout": {
        "x": 7,
        "y": 7,
        "width": 4,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "Control Plane Memory",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              },
              {
                "formula": "query2"
              },
              {
                "formula": "query3"
              },
              {
                "formula": "query4"
              },
              {
                "formula": "query5"
              },
              {
                "formula": "query6"
              },
              {
                "formula": "query7"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:istio.process.virtual_memory_bytes{$cluster}",
                "data_source": "metrics",
                "name": "query1"
              },
              {
                "query": "avg:istio.process.resident_memory_bytes{$cluster}",
                "data_source": "metrics",
                "name": "query2"
              },
              {
                "query": "avg:istio.go.memstats.heap_sys_bytes{$cluster}",
                "data_source": "metrics",
                "name": "query3"
              },
              {
                "query": "avg:istio.go.memstats.heap_alloc_bytes{$cluster}",
                "data_source": "metrics",
                "name": "query4"
              },
              {
                "query": "avg:istio.go.memstats.alloc_bytes{$cluster}",
                "data_source": "metrics",
                "name": "query5"
              },
              {
                "query": "avg:istio.go.memstats.heap_inuse_bytes{$cluster}",
                "data_source": "metrics",
                "name": "query6"
              },
              {
                "query": "avg:istio.go.memstats.stack_inuse_bytes{$cluster}",
                "data_source": "metrics",
                "name": "query7"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ]
      },
      "layout": {
        "x": 0,
        "y": 9,
        "width": 4,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "Pilot Errors",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              },
              {
                "formula": "query2"
              },
              {
                "formula": "query3"
              },
              {
                "formula": "query4"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:istio.pilot.conflict.inbound_listener{$cluster}",
                "data_source": "metrics",
                "name": "query1"
              },
              {
                "query": "avg:istio.pilot.conflict.outbound_listener.http_over_current_tcp{$cluster}",
                "data_source": "metrics",
                "name": "query2"
              },
              {
                "query": "avg:istio.pilot.conflict.outbound_listener.tcp_over_current_http{$cluster}",
                "data_source": "metrics",
                "name": "query3"
              },
              {
                "query": "avg:istio.pilot.conflict.outbound_listener.tcp_over_current_tcp{$cluster}",
                "data_source": "metrics",
                "name": "query4"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ],
        "events": [
          {
            "q": "cluster:$cluster.value, tag:event:deployment",
            "tags_execution": "and"
          }
        ]
      },
      "layout": {
        "x": 4,
        "y": 9,
        "width": 3,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "Pilot - Unready Endpoints",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:istio.pilot.endpoint_not_ready{$cluster} by {endpoint}",
                "data_source": "metrics",
                "name": "query1"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ],
        "events": [
          {
            "q": "cluster:$cluster.value, tag:event:deployment",
            "tags_execution": "and"
          }
        ]
      },
      "layout": {
        "x": 7,
        "y": 9,
        "width": 4,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "ELB",
        "title_size": "16",
        "title_align": "left",
        "type": "query_value",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              }
            ],
            "response_format": "scalar",
            "queries": [
              {
                "query": "sum:aws.elb.healthy_host_count{$aws_account}",
                "data_source": "metrics",
                "name": "query1",
                "aggregator": "last"
              }
            ]
          }
        ],
        "autoscale": true,
        "precision": 2
      },
      "layout": {
        "x": 0,
        "y": 11,
        "width": 1,
        "height": 1
      }
    },
    {
      "definition": {
        "type": "note",
        "content": "load balancer status",
        "background_color": "gray",
        "font_size": "18",
        "text_align": "center",
        "vertical_align": "center",
        "show_tick": false,
        "tick_pos": "50%",
        "tick_edge": "left",
        "has_padding": true
      },
      "layout": {
        "x": 1,
        "y": 11,
        "width": 10,
        "height": 1
      }
    },
    {
      "definition": {
        "title": "Average Load Balancer Latency.95",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:aws.elb.latency.p95{$aws_account} by {name}",
                "data_source": "metrics",
                "name": "query1"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ],
        "events": [
          {
            "q": "cluster:$cluster.value, tag:event:deployment",
            "tags_execution": "and"
          }
        ]
      },
      "layout": {
        "x": 0,
        "y": 12,
        "width": 6,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "4XX and 5XX Error Rates",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              },
              {
                "formula": "query2"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "sum:aws.elb.httpcode_target_4xx{$aws_account} by {name}.as_count()",
                "data_source": "metrics",
                "name": "query1"
              },
              {
                "query": "sum:aws.elb.httpcode_target_5xx{$aws_account} by {name}.as_count()",
                "data_source": "metrics",
                "name": "query2"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "bars"
          }
        ],
        "events": [
          {
            "q": "cluster:$cluster.value, tag:event:deployment",
            "tags_execution": "and"
          }
        ]
      },
      "layout": {
        "x": 6,
        "y": 12,
        "width": 5,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "Average Requests by Host",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:aws.elb.request_count{$aws_account} by {name}.as_count()",
                "data_source": "metrics",
                "name": "query1"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "bars"
          }
        ]
      },
      "layout": {
        "x": 0,
        "y": 14,
        "width": 6,
        "height": 2
      }
    },
    {
      "definition": {
        "title": "Average Concurrent and Failed connections",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "type": "timeseries",
        "requests": [
          {
            "formulas": [
              {
                "formula": "query1"
              },
              {
                "formula": "query2"
              }
            ],
            "response_format": "timeseries",
            "queries": [
              {
                "query": "avg:aws.elb.active_connection_count{$aws_account} by {name}.as_count()",
                "data_source": "metrics",
                "name": "query1"
              },
              {
                "query": "avg:aws.elb.backend_connection_errors{$aws_account} by {name}.as_count()",
                "data_source": "metrics",
                "name": "query2"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "bars"
          }
        ]
      },
      "layout": {
        "x": 6,
        "y": 14,
        "width": 5,
        "height": 2
      }
    }
  ],
  "template_variables": [
    {
      "name": "aws_account",
      "default": "481538974648",
      "prefix": "aws_account",
      "available_values": []
    },
    {
      "name": "cluster",
      "default": "prod-us-east-1",
      "prefix": "cluster",
      "available_values": [
        "sandbox-us-east-2",
        "prod-us-east-1"
      ]
    },
    {
      "name": "node",
      "default": "*",
      "prefix": "node",
      "available_values": []
    }
  ],
  "layout_type": "ordered",
  "is_read_only": false,
  "notify_list": [],
  "reflow_type": "fixed"
}