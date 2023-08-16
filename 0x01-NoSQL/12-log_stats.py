#!/usr/bin/env python3
"""This script provides some stats about Nginx logs stored in MongoDB"""
import pymongo


def print_log():
    """This function provides some stats about Nginx logs stored in MongoDB"""
    client = pymongo.MongoClient()
    db = client.logs
    nginx = db.nginx

    print('{} logs'.format(nginx.count_documents({})))
    print('Methods:')
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        print('\tmethod {}: {}'.
              format(method, nginx.count_documents({"method": method})))
    print('{} status check'.format(nginx.count_documents
                                   ({"method": "GET", "path": "/status"})))

    client.close()


if __name__ == '__main__':
    print_log()
