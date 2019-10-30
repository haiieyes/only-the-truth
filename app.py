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

#Landing Site
@app.route('/')
def home():
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = "SELECT albums.*,albumReviews.* FROM albums, albumReviews WHERE albums.albumID = albumReviews.albumID limit 3"
    cursor.execute(sql)
    return render_template("index.template.html", results=cursor)

#Read A Review
@app.route('/reviews/read/<albumID>')
def readReview(albumID):
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = "SELECT * FROM albumReviews WHERE albumID = {}".format(albumID)
    cursor.execute(sql)
    reviewCursor = cursor.fetchall()
    
    sql = "SELECT * FROM albums WHERE albumID = {}".format(albumID)
    cursor.execute(sql)
    album = cursor.fetchone()
    
    return render_template('readreview.template.html', album=album, reviewCursor=reviewCursor)
    
#View Tracks of an Album
@app.route('/tracks/<albumID>')
def viewTracks(albumID):
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = "SELECT * FROM albums WHERE albumID = {}".format(albumID)
    cursor.execute(sql)
    album = cursor.fetchone()
    
    sql = "SELECT * FROM tracks WHERE albumID = {}".format(albumID)
    cursor.execute(sql)
    
    return render_template('viewtracks.template.html', album=album, tracks=cursor)
    
#Add A Review
@app.route('/reviews/add')
def addReview():
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = "SELECT * FROM albums"
    cursor.execute(sql)
    
    return render_template("addreview.template.html", albums=cursor)
    
@app.route('/reviews/add', methods=['POST'])
def processAddReview():
    albumID = request.form['albumID']
    nick = request.form['nick']
    review = request.form['review']
    
    connection = get_connection()
    cursor = connection.cursor()

    sql = """
     INSERT INTO albumReviews (albumID, nick, review)
     VALUES ({}, "{}", "{}")
    """.format(albumID, nick, review)
    
    cursor.execute(sql)
    connection.commit()
    
    return redirect("/")

#Add An Album
@app.route('/albums/add')
def addAlbum():
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = "SELECT * FROM artists"
    cursor.execute(sql)
    
    return render_template("addalbum.template.html", artist=cursor)
    
@app.route('/albums/add', methods=['POST'])
def processAddAlbum():
    artistID = request.form['artistID']
    albumName = request.form['albumName']
    albumGenre = request.form['albumGenre']
    albumDescription = request.form['albumDescription']
    albumArt = request.form['albumArt']
    
    connection = get_connection()
    cursor = connection.cursor()

    sql = """
     INSERT INTO albumReviews (artistID, albumName, albumGenre, albumDescription, albumArt)
     VALUES ({}, "{}", "{}", "{}", "{}")
    """.format(artistID, albumName, albumGenre, albumDescription, albumArt)
    
    cursor.execute(sql)
    connection.commit()
    
    return redirect("/reviews/add")

# "magic code" -- boilerplate
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)