#!/usr/bin/env python3
"""This file contains a class that handle data storage using redis"""
from functools import wraps
from typing import Union, Callable, Optional

import redis
import uuid


def count_calls(method: Callable) -> Callable:
    """This counts the number of calls made to a method"""
    key = method.__qualname__

    @wraps(method)
    def counter(self, *args, **kwargs):
        """This is a decorator method"""
        self._redis.incr(key)
        return method(self, *args, **kwargs)

    return counter


class Cache:
    """Cache class: uses Redis"""

    def __init__(self):
        """Init method for Cache class"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def get(self, key: str, fn: Optional[Callable] = None):
        """This method takes a key string argument and an optional
        Callable argument named fn. This callable will be
        used to convert the data back to the desired format."""
        value = self._redis.get(key)
        if value:
            if fn:
                return fn(value)
            return value

    def get_int(self, key: str) -> int:
        """This method is used to parametrize Cache.get()"""
        return self.get(key, lambda value: int(value))

    def get_str(self, key: str) -> str:
        """This method is used to parametrize Cache.get()"""
        return self.get(key, lambda value: value.decode('utf-8'))

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """This method takes data as an argument and returns a string"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

# cache = Cache()
#
# data = "hello"
# key = cache.store(data)
# print(key)
#
# local_redis = redis.Redis()
# print(local_redis.get(key))
