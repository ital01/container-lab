import { createServer } from 'http';

const PORT = 3000;
const HOST = '0.0.0.0';

const server = createServer((req, res) => {
  if (req.url === '/') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello from Node.js!');
  }
});

server.listen(PORT, HOST, () => {
  console.log(`Hello-container listening at http://${HOST}:${PORT}`);
});
