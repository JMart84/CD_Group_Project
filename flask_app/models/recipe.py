from flask_app.config.mysqlconnection import connectToMySQL
from flask import Flask, flash
from flask_bcrypt import Bcrypt
from flask_app.models import user
from flask_app import app
import re

class Recipe:
    def __init__(self, data):
        self.id = data["id"]
        self.name = data["name"]
        self.description = data["description"]
        self.allgrain = data["allgrain"]
        self.maltgrain = data["maltgrain"]
        self.privacy = data["privacy"]
        self.hopsched = data["hopsched"]
        self.yeast = data["yeast"]
        self.instructions = data["instructions"]
        self.notes = data["notes"]
        self.created_at = data["created_at"]
        self.updated_at = data["updated_at"]
        self.user_id = data["user_id"]
        self.creator = user.User.get_user({"id": data["user_id"]})
        self.users_who_liked = []

    @classmethod
    def get_all(cls):
        query = "SELECT * FROM recipes LEFT JOIN users ON users.id = recipes.user_id WHERE privacy=0;"
        results = connectToMySQL("recipes").query_db(query)
        recipes = []
        for recipe in results:
            recipes.append(cls(recipe))
        return recipes

    @classmethod
    def get_user_recipes(cls, data):
        query = "SELECT * FROM recipes WHERE user_id = %(user_id)s AND privacy = 0;"
        results = connectToMySQL("recipes").query_db(query, data)
        recipes = []
        users = []
        for recipe in results:
            recipes.append(cls(recipe))
        # for user in results:
        #     users.append(cls(user))
        return recipes

# ****************************************
# THIS IS THE ONE WE ARE MESSING WITH!!!
# ****************************************

    @classmethod
    def get_all_recipes(cls):
        query = "SELECT * FROM recipes "\
                "LEFT JOIN users ON users.id = recipes.user_id "\
                "LEFT JOIN liked_recipes ON recipes.id = liked_recipes.recipe_id "\
                "LEFT JOIN users AS users2 ON users2.id = liked_recipes.user_id "\
                "ORDER BY recipes.created_at DESC"

        results = connectToMySQL("recipes").query_db(query)
        all_recipes = []

        for result in results:
            new_recipe = True
            like_user_data = {
                "id" : result["users2.id"],
                "first_name": result["users2.first_name"],
                "last_name": result["users2.last_name"],
                "email": result["users2.email"],
                "password": result["users2.password"],
                "created_at": result["users2.created_at"],
                "updated_at": result["users2.updated_at"]
            }
            # all_recipes[len(all_recipes)-1].users_who_liked.append(user(like_user_data))
            # new_recipe = False
            if len(all_recipes) >0 and all_recipes[len(all_recipes) -1].id == result['id']:
                all_recipes[len(all_recipes)-1].users_who_liked.append(user(like_user_data))
                new_recipe = False

            if new_recipe:
                recipe = cls(result)
                creator_data = {
                    "id" : result["users.id"],
                    "first_name": result["first_name"],
                    "last_name": result["last_name"],
                    "email": result["email"],
                    "password": result["password"],
                    "created_at": result["users.created_at"],
                    "updated_at": result["users.updated_at"]
                }
                recipe.creator = user(creator_data)
                #There is a user who liked this recipe that needs to be processed
                if result['users2.id'] is not None:
                    recipe.users_who_liked.append(user(like_user_data))
                all_recipes.append(recipe)
            return all_recipes


    @classmethod
    def get_session_recipes(cls, data):
        query = "SELECT * FROM recipes WHERE user_id = %(user_id)s;"
        results = connectToMySQL("recipes").query_db(query, data)
        recipes = []
        for recipe in results:
            recipes.append(cls(recipe))
        return recipes


    @classmethod
    def find_by_id(cls, data):
        query = "SELECT * FROM recipes WHERE id = %(id)s;"
        results = connectToMySQL("recipes").query_db(query, data)
        if len(results) < 1:
            return False
        else:
            return cls(results[0])

    @classmethod
    def create_recipe(cls, data):
        for row in data:
            print(row, data[row])
        query = "INSERT INTO recipes (name, description, allgrain, maltgrain, privacy, hopsched, yeast, instructions, notes, created_at, updated_at, recipes.user_id) VALUES (%(name)s, %(description)s, %(allgrain)s, %(maltgrain)s, %(privacy)s, %(hopsched)s, %(yeast)s, %(instructions)s, %(notes)s, NOW(), NOW(), %(user_id)s);"
        return connectToMySQL("recipes").query_db(query, data)

    @classmethod
    def update_recipe(cls, data):
        for key in data:
            print(key, ":", data[key])
        query = "UPDATE recipes.recipes SET recipes.name=%(name)s, recipes.description=%(description)s, recipes.allgrain=%(allgrain)s, recipes.maltgrain=%(maltgrain)s, recipes.privacy=%(privacy)s, recipes.hopsched=%(hopsched)s, recipes.yeast=%(yeast)s, recipes.instructions=%(instructions)s, recipes.notes=%(notes)s, recipes.updated_at=NOW() WHERE recipes.id = %(id)s;"
        connectToMySQL("recipes").query_db(query, data)

    @classmethod
    def delete_recipe(cls, data):
        query = "DELETE FROM recipes WHERE recipes.id = %(id)s"
        connectToMySQL("recipes").query_db(query, data)

    @classmethod
    def like_recipe(cls, data):
        query = "INSERT INTO liked_recipes(recipe_id,user_id) VALUES(%(recipe_id)s,%(user_id)s)"
        return connectToMySQL("recipes").query_db(query, data)

    @classmethod
    def dislike_recipe(cls, data):
        query = "DELETE FROM liked_recipes WHERE recipe_id=%(recipe_id)s AND user_id=%(user_id)s"
        return connectToMySQL("recipes").query_db(query, data)

    @classmethod
    def get_all_user_liked_recipes(cls, data):
        recipes_liked = []
        query = "SELECT recipe_id FROM liked_recipes JOIN users ON users.id=user_id WHERE user_id=%(id)s"
        results = connectToMySQL("recipes").query_db(query, data)
        for result in results:
            recipes_liked.append(result['recipe_id'])
        return recipes_liked

    @staticmethod
    def validate_recipe(recipe_info):
        valid_recipe = True
        if not 3 <= len(recipe_info["name"]) <= 255:
            valid_recipe = False
            flash("Name must be between 3 and 255 characters", "name")
        if not 20 <= len(recipe_info["description"]) <= 255:
            valid_recipe = False
            flash("Description must be between 20 and 255 characters", "description")
        if not 3 <= len(recipe_info["allgrain"]):
            valid_recipe = False
            flash("All-grain must be more than 3 characters", "allgrain")
        if not 3 <= len(recipe_info["maltgrain"]):
            valid_recipe = False
            flash("Malt-grain must be more than 3 characters", "maltgrain")
        if not 3 <= len(recipe_info["hopsched"]):
            valid_recipe = False
            flash("Hops Schedule must be more than 3 characters", "hopsched")
        if not 3 <= len(recipe_info["yeast"]):
            valid_recipe = False
            flash("Yeast must be more than 3 characters", "yeast")
        if not 20 <= len(recipe_info["instructions"]):
            valid_recipe = False
            flash("Instructions must be more than 3 characters", "instructions")
        if not 3 <= len(recipe_info["notes"]):
            valid_recipe = False
            flash("Notes must be more than 3 characters", "notes")
        return valid_recipe
