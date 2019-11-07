from app import app
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
    
    sql = "SELECT albums.*,albumReviews.* FROM albums, albumReviews WHERE albums.albumID = albumReviews.albumID ORDER BY reviewID DESC limit 3"
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
     INSERT INTO albums (artistID, albumName, albumGenre, albumDescription, albumArt)
     VALUES ({}, "{}", "{}", "{}", "{}")
    """.format(artistID, albumName, albumGenre, albumDescription, albumArt)
    
    cursor.execute(sql)
    connection.commit()
    
    return redirect("/reviews/add")
    
#Add An Artist
@app.route('/artists/add')
def addArtist():
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    return render_template("addartist.template.html")
    
@app.route('/artists/add', methods=['POST'])
def processAddArtist():
    artistName = request.form['artistName']
    
    connection = get_connection()
    cursor = connection.cursor()

    sql = """
     INSERT INTO artists (artistName)
     VALUES ("{}")
    """.format(artistName)
    
    cursor.execute(sql)
    connection.commit()
    
    return redirect("/albums/add")

#Edit A Review
@app.route('/reviews/edit/<reviewID>')
def showEditAlbumForm(reviewID):
    connection = get_connection()
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = "SELECT albums.*,albumReviews.* FROM albums, albumReviews WHERE albums.albumID = albumReviews.albumID AND reviewID = {}".format(reviewID)
    cursor.execute(sql)
    
    review = cursor.fetchone()
    
    return render_template('editreview.template.html', review=review)
    
@app.route('/reviews/edit/<reviewID>', methods=['POST'])
def processEditAlbum(reviewID):
    albumID = request.form['albumID']
    nick = request.form['nick']
    review = request.form['review']
    
    connection = get_connection()
    cursor = connection.cursor()
    
    sql = """
    UPDATE albumReviews SET nick = "{}", albumID = {}, review = "{}"
    WHERE reviewID = {}
    """.format(nick, albumID, review, reviewID)
    
    cursor.execute(sql)
    connection.commit()
    connection.close()
    return redirect("/reviews/read/{}".format(albumID))
   
@app.route('/reviews/delete/<reviewID>')
def processDeleteAlbum(reviewID):
    connection = get_connection()
    cursor = connection.cursor()
    
    sql = "DELETE FROM reviews WHERE reviewID = {}".format(reviewID)
    
    cursor.execute(sql)
    
    return redirect("/")

#Search
@app.route('/', methods=['POST'])
def process_search():
    # try to retrieve out what the person has entered into the field
    artist = request.form['artistName']
    album = request.form['albumName']
    
    # create connection
    connection = get_connection()
        
    cursor = connection.cursor(pymysql.cursors.DictCursor)
    
    sql = """
        SELECT * FROM albums 
        INNER JOIN artists ON albums.artistID = artists.artistId
        WHERE albums.albumName LIKE '%{}%' AND artists.artistName LIKE '%{}%'
        
    """.format(album, artist)

    cursor.execute(sql)
    
    # MAKE SURE TO COMMENT OUT THE TEST CODE
    # for each_result in cursor:
    #     print(each_result)
    return render_template("search.template.html", album=cursor)

# "magic code" -- boilerplate
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)