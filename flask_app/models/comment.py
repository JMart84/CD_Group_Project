from flask_app.config.mysqlconnection import connectToMySQL
from flask import Flask, flash
from flask_app.models.recipe import Recipe
from flask_app import app
import re

class Comment:
    def __init__(self, data):
        self.id = data["id"]
        self.comment = data["comment"]
        self.created_at = data["created_at"]
        self.updated_at = data["updated_at"]
        self.user_id = data["user_id"]
        self.recipe_id = data["recipe_id"]

    @classmethod
    def create_recipe(cls, data):
        for row in data:
            print(row, data[row])
        query = "INSERT INTO comments (comment, created_at, updated_at, user_id, recipe_id) VALUES (%(comment)s, NOW(), NOW(), %(user_id)s, %(recipe_id)s);"
        return connectToMySQL("recipes").query_db(query, data)