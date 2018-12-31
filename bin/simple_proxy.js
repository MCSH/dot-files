#!/usr/bin/node

const http = require('http');

const PORT = process.argv[2];
const HOST = process.argv[3];
const OUT_PORT = process.argv[4] || 80;

http.createServer(onRequest).listen(PORT);

function onRequest(client_req, client_res) {
  console.log('serve: ' + client_req.url);

  var options = {
    hostname: HOST,
    port: OUT_PORT,
    path: client_req.url,
    method: client_req.method,
    headers: client_req.headers
  };

  var proxy = http.request(options, function (res) {
    client_res.writeHead(res.statusCode, res.headers)
    res.pipe(client_res, {
      end: true
    });
  });

  client_req.pipe(proxy, {
    end: true
  });
}
