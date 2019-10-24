from flask import Flask, render_template, request, redirect, url_for
import os
import pymysql

app = Flask(__name__)

def get_connection():
    connection = pymysql.connect(host='localhost',
        user="admin",
        password="password",
        database="albumReviews"
    )
    return connection

@app.route('/')
def home():
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = "SELECT albums.*,albumReviews.* FROM albums, albumReviews WHERE albums.albumID = albumReviews.albumID limit 3"
    cursor.execute(sql)
    return render_template("index.template.html", results=cursor)

    
# "magic code" -- boilerplate
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)