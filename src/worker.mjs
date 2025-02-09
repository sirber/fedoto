import { createClient } from "redis";

const subscriber = createClient({
  url: process.env.REDIS_URL,
});

async function startWorker() {
  await subscriber.connect();

  await subscriber.subscribe("outbox", (message) => {
    console.log(`Received message: ${message}`);

    // TODO: handle outbox
  });

  console.log("Worker is listening for Redis messages...");
}

startWorker().catch(console.error);
