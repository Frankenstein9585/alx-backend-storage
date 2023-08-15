#!/usr/bin/env python3
"""This file contains a function that changes all
the topics of a school document based on the name"""
import pymongo


def update_topics(mongo_collection, name, topics):
    """This function changes all
    the topics of a school document based on the name"""
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
