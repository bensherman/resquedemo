# resquedemo

Open up 3 terminal windows.

1. `docker compose build && docker compose up redis`
2. `COUNT=10 QUEUE=sleepy docker compose up workers`
3. `docker compose up jobs`

In window 1, we'll see redis running.

In window 2 we will see workers waiting, then running when window 3 runs.

In window 3 we will see jobs getting added to the queue.

