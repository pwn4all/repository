#!/usr/bin/env python3

#-*- coding: utf-8 -*-

## pip3 install opensearch-py
from opensearchpy import OpenSearch, RequestsHttpConnection

auth = ('admin', 'admin')
host="127.0.0.1"
port=9200
os_client = OpenSearch(
    hosts = [{'host': host, 'port': port}],
    http_auth = auth,
    use_ssl = True,
    verify_certs=False,
    connection_class = RequestsHttpConnection
)

def search(message, q_type):
    q=message
    query = {
        'size' : 10,
        'query' : {
            'multi_match' : {
                'query' : q,
                'fields': ['message']
                }
            }
        }
    if q_type == "cpu":
        response = os_client.search(body = query, index='computer-cpu-*')

    else :
        response = os_client.search(body = query, index='building-car-*')
        print(response)
        msg_dic = {}
        msg_value = []
        for msg_each in response['hits']['hits']:
            msg_value.append(msg_each['_source']['date'] + ":" + msg_each['_source']['message'])
            msg_dic[msg_each['_source']['id']] = msg_value
        msg_dic['count'] = response['hits']['total']['value']
    return msg_dic


print(search('Hello', 'target_index'))
