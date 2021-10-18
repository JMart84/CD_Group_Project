from flask import Flask, render_template, redirect, session, flash, request
from flask_app import app
from flask_app.models.user import User
from flask_app.models.recipe import Recipe
import os
from werkzeug.utils import secure_filename
from flask_bcrypt import Bcrypt

bcrypt = Bcrypt(app)

ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])

def allowed_file(filename):
	return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/users/new", methods=["POST"])
def new_user():
    if User.validate_registration(request.form):
        user = {}
        for key in request.form:
            user[key] = request.form[key]
        pw_hash = bcrypt.generate_password_hash(request.form["password"])
        user["password"] = pw_hash
        new_id = User.register_user(user)
        session["user_id"] = new_id
        session["user_name"] = request.form["first_name"] + " " + request.form["last_name"]
        session["logged_in"] = True
        return redirect("/dashboard")
    else:
        return redirect("/")

@app.route("/users/login", methods=["POST"])
def login_user():
    login_info = request.form
    if User.validate_login(login_info):
        this_user = User.find_by_email(login_info)
        session["user_id"] = this_user.id
        session["user_name"] = this_user.first_name
        session["logged_in"] = True
        print(session["user_id"])
        return redirect("/dashboard")
    else:
        return redirect("/")

@app.route("/users/<int:user_id>", methods=["GET"])
def show_user(user_id):
    if "user_id" not in session:
        return redirect("/")
    user_data = {
        "id": user_id
    }
    user = User.get_user(user_data)
    data = {
        "user_id": user_id
    }
    user_recipes = Recipe.get_user_recipes(data)
    return render_template("user.html", user = user, user_id = user_id, user_recipes = user_recipes)

@app.route("/users/account", methods=["GET"])
def session_user():
    if "user_id" not in session:
        return redirect("/")
    user_data = {
        "id": session["user_id"]
    }
    user = User.get_user(user_data)
    data = {
        "user_id": user.id
    }
    my_recipes = Recipe.get_session_recipes(data)
    return render_template("account.html", user = user, user_id = user.id, my_recipes = my_recipes)

# ---------------------------------
# CURRENTLY WORKING ON USERS EDIT  //image upload follow woofy pets.py lines 30-51
# ---------------------------------
@app.route("/users/account/edit", methods=["GET", "POST"])
def edit_user():
    user_data = {
        "id": session["user_id"]
    }
    user = User.get_user(user_data)
    if session["user_id"] != user.id:
        return redirect("/logout")
    if request.method == "GET":
        edit = True
        data = {"id" : user.id}
        user = User.get_user(data)
        return render_template("edit_user.html", edit=edit, user=user, user_id = user.id)
    elif request.method == "POST":
        data = {}
        for key in request.form:
            data[key] = request.form[key]
        data["id"] = user.id
        User.update_user(data)
        return redirect(f"/users/account")
        # else:
        #     return redirect(f"/users/account/edit")
    else:
        return "I'm sorry, that request method isn't allowed"

@app.route("/logout", methods=["POST"])
def logout():
    session["user_id"] = None
    session["user_name"] = None
    session["logged_in"] = False
    return redirect("/")