#!/usr/bin/env python2.7
import os
import sys

from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response

def hello_world(request):
    environ = request.environ
    lines = ['Hello %(name)s!' % request.matchdict, '']
    lines.extend(
            '{0}={1}\n'.format(k,environ[k])
            for k in sorted(environ)
    )
    return Response('<br>'.join(lines))

def make_app():
    config = Configurator()
    config.add_route('hello', '/hello/{name}')
    config.add_view(hello_world, route_name='hello')
    return config.make_wsgi_app()

def run_app(app):
    port = int(os.environ.get("PORT", "8082"))
    server = make_server('0.0.0.0', port, app)
    print >>sys.stderr, 'Listening on port %i' % port
    sys.stderr.flush()
    server.serve_forever()

application = make_app()
if __name__ == '__main__':
    run_app(application)
