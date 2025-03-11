// Make sure to install the 'hono' package using npm:
// npm install hono

import { Hono } from 'hono';

const app = new Hono();

// Access logging middleware
app.use('*', async (c, next) => {
  const start = Date.now();
  const method = c.req.method;
  const path = c.req.path;
  
  await next();
  
  const status = c.res.status;
  const time = Date.now() - start;
  
  console.log(`${method} ${path} - ${status} (${time}ms)`);
});

// GET /ping route
app.get('/ping', (c) => c.text('pong'));

// POST /logs route
app.post('/logs', async (c) => {
  const body = await c.req.json();
  console.log(body);
  return c.text('Logged');
});

// GET /fail route
app.get('/fail', (c) => c.text('uh oh', 500));

export default app; 
