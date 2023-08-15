#!/usr/bin/env python3
"""This file contains a function inserts a
new document in a collection based on kwargs"""
import pymongo


def list_all(mongo_collection, **kwargs):
    """This function inserts a
    new document in a collection based on kwargs"""
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
