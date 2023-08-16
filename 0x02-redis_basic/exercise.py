#!/usr/bin/env python3
"""This file contains a class that handle data storage using redis"""
import redis
import uuid


class Cache:
    """Cache class: uses Redis"""
    def __init__(self):
        """Init method for Cache class"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: str | bytes | int | float) -> str:
        """This method takes data as an argument and returns a string"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
