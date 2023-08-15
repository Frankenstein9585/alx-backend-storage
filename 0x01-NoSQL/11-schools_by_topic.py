#!/usr/bin/env python3
"""This file contains a function that returns a list of schools
having a specific topic"""
import pymongo


def schools_by_topic(mongo_collection, topic):
    """This function returns a list of schools having a specific topic"""
    return mongo_collection.find({"topics": {"$in": [topic]}})
