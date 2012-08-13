#!/usr/bin/env python
import os

from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response

def hello_world(request):
   return Response('Hello %(name)s!' % request.matchdict)

def main():
   config = Configurator()
   config.add_route('hello', '/hello/{name}')
   config.add_view(hello_world, route_name='hello')
   app = config.make_wsgi_app()
   port = int(os.environ.get("PORT", "8082"))
   server = make_server('0.0.0.0', port, app)
   server.serve_forever()

if __name__ == '__main__':
    main()
