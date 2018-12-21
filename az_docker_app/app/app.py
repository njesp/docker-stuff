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
        insert into visits(client_ip) values (%(client_ip)s)
    """
    sql_query = """
        select
            v.time_of_visit
            , v.client_ip
        from visits v
        order by
            v.time_of_visit desc fetch first 100 rows only
    """
    client_ip = request.environ.get('HTTP_X_REAL_IP', request.remote_addr)
    con = psycopg2.connect("dbname=demodb user=demo password=demopwd host=db port=5432")
    cur = con.cursor()
    cur.execute(sql_insert, {"client_ip": client_ip})
    cur.execute(sql_query)
    rows = cur.fetchall()
    html_txt = "<h3>Goddaw do! Tidspunkter og klient IP-adresser på seneste 100 besøg</h3>"
    for i in rows:
        html_txt += f'<br/><b>tid:</b> {i[0]} <b>klient ip</b>: {i[1]}<br/>'
    cur.close()
    con.commit()
    con.close()
    return html_txt


if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=80)
