#!/usr/bin/env python3
"""This file contains a function lists all the documents in a collection"""
import pymongo


def list_all(mongo_collection):
    """This function lists all the documents in a given collection"""
    return mongo_collection.find()
