import { serve } from '@hono/node-server';
import app from './server';

// Create server instance
const server = serve({
  fetch: app.fetch,
  port: 3000
}, (info: { port: number }) => {
  console.log(`Server is running on http://localhost:${info.port}`);
});

// Handle graceful shutdown on SIGINT (Ctrl+C)
process.on('SIGINT', () => {
  console.log('\nGracefully shutting down server...');
  server.close(() => {
    console.log('Server has been shut down');
    process.exit(0);
  });
});
