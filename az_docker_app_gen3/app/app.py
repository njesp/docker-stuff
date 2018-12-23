"""
Docstring
"""
import psycopg2
from flask import Flask, request

APP = Flask(__name__)


@APP.route("/")
def hello():
    """
    Docstring
    """
    sql_insert = """
        insert into visits(user_agent) values (%(user_agent)s)
    """
    sql_query = """
        select
            v.time_of_visit
            , v.user_agent
        from visits v
        order by
            v.time_of_visit desc fetch first 100 rows only
    """
    user_agent = request.headers.get('User-Agent')

    if user_agent is None:
        user_agent = 'Ingen User-Agent medsendt. Non browser client suspected!'

    con = psycopg2.connect("dbname=demodb user=demo password=demopwd host=db port=5432")
    cur = con.cursor()
    cur.execute(sql_insert, {"user_agent": user_agent})
    cur.execute(sql_query)
    rows = cur.fetchall()
    html_txt = """<h3>Goddaw do fra MultiContainerApp!
     Tidspunkter og klientens User-Agent på seneste 100 besøg</h3>
    """
    for i in rows:
        html_txt += f'<br/><b>tid:</b> {i[0]} <b>user_agent</b>: {i[1]}<br/>'
    cur.close()
    con.commit()
    con.close()
    return html_txt


if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=80)
